var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Trainer = require('../models/trainer');



router.get('/:message?', function(req, res, next) {
    const query = "SELECT * FROM trainer";
    var fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;

    dbconnection.query(query, function(err, rows) {

        if(err) {
            res.render('trainer', { title: 'Trainer - ERROR', trainer: '', message: req.params.message });
        } else {
            res.render('trainer', { title: 'Trainer', trainer:rows, message: req.params.message, url: fullUrl });
        }
    });
});


router.get('/add/trainer/', function(req, res, next) {
    res.render('trainer_new', { title: 'Trainer - Add New', message:'' });
});


router.post('/add/trainer/', function(req, res, next) {
    let trainer = new Trainer(undefined, req.body.tfname, req.body.tlname, req.body.tsubject);
    const query2 = `INSERT INTO trainer(tfname, tlname, tsubject) VALUES('${trainer.tfname}', '${trainer.tlname}', '${trainer.tsubject}');`;
    dbconnection.query(query2, function(err, status) {

        if(err) {
            res.render("trainer_new", { title: 'Trainer - Add New', message: "Error inserting data to the database!" });
        } 

        else {

            res.redirect('/trainer/');
        }

    });
});


router.get('/delete/trainer/:tid', function(req, res, next) {
    
    var query = "DELETE FROM `trainer` WHERE `tid` = ?";
    const trainerId = req.params.tid;
    
    dbconnection.execute(query, [trainerId], function(err, result, fields) {
        console.log(err);
        if(err) {

        } else {
           
            res.redirect('/trainer/');        
        }
    });
});


router.get('/edit/trainer/:tid', function(req, res, next) {
    const trainerId = req.params.tid;
    var query = "SELECT * FROM `trainer` WHERE `tid` = ?";
    dbconnection.execute(query, [trainerId], function(err, result, fields) {
        // console.log(result[0]);
        let trainer = new Trainer(result[0].tid, result[0].tfname, result[0].tlname, result[0].tsubject);
        // console.log(student);
        res.render('trainer_edit', { title: 'Trainer - Edit', message:'',  trainer: trainer});
    });
});


router.post('/update', function(req, res, next) {
    let trainer = new Trainer(req.body.tid, req.body.tfname, req.body.tlname, req.body.tsubject);
 
    const query = "UPDATE `trainer` SET `tfname` = ?, `tlname` = ?, `tsubject` = ? WHERE `tid` = ?;";
    dbconnection.execute(query, [trainer.tfname, trainer.tlname, trainer.tsubject, trainer.tid], function(err, status) {
        if(err) {
            res.render('trainer_edit', { title: 'Trainer - Edit', message:'Update failed! Check the values again!',  trainer: trainer});

        } else {
            res.redirect('/trainer/');
        }
    });
});

module.exports = router;
  