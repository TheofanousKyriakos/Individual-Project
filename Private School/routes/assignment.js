var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Assignment = require('../models/assignment');


router.get('/:message?', function(req, res, next) {
    const query = "SELECT * FROM assignment";
    var fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;

    dbconnection.query(query, function(err, rows) {

        if(err) {
            res.render('assignment', { title: 'Assignment - ERROR', assignment: '', message: req.params.message });
        } else {
            res.render('assignment', { title: 'Assignment', assignment:rows, message: req.params.message, url: fullUrl });
        }
    });
});


router.get('/add/assignment/', function(req, res, next) {
    res.render('assignment_new', { title: 'Assignment - Add New', message:'' });
});


router.post('/add/assignment/', function(req, res, next) {
    let assignment = new Assignment(undefined, req.body.title, req.body.descr, req.body.subdate, req.body.ormark, req.body.tmark);
    const query2 = `INSERT INTO assignment(title, descr, subdate, ormark, tmark) VALUES('${assignment.title}', '${assignment.descr}', '${assignment.subdate}', '${assignment.ormark}', '${assignment.tmark}');`;
    dbconnection.query(query2, function(err, status) {
        
        if(err) {
            res.render("assignment_new", { title: 'Assignment - Add New', message: "Error inserting data to the database!" });
        } 

        else {

            res.redirect('/assignment/');
        }

    });
});


router.get('/delete/assignment/:aid', function(req, res, next) {
    
    var query = "DELETE FROM `assignment` WHERE `aid` = ?";
    const assignmentId = req.params.aid;
    
    dbconnection.execute(query, [assignmentId], function(err, result, fields) {
        // console.log(err);
        if(err) {

        } else {
           
            res.redirect('/assignment/');        
        }
    });
});


router.get('/edit/assignment/:aid', function(req, res, next) {
    const assignmentId = req.params.aid;
    var query = "SELECT * FROM `assignment` WHERE `aid` = ?";
    dbconnection.execute(query, [assignmentId], function(err, result, fields) {
        // console.log(result[0]);
        let assignment = new Assignment(result[0].aid, result[0].title, result[0].descr, result[0].subdate, result[0].ormark, result[0].tmark);
        // console.log(student);
        res.render('assignment_edit', { title: 'Assignment - Edit', message:'',  assignment: assignment});
    });
});


router.post('/update', function(req, res, next) {
    let assignment = new Assignment(req.body.aid, req.body.title, req.body.descr, req.body.subdate, req.body.ormark, req.body.tmark);
 
    const query = "UPDATE `assignment` SET `title` = ?, `descr` = ?, `subdate` = ?, `ormark` = ?, `tmark` = ? WHERE `aid` = ?;";
    dbconnection.execute(query, [assignment.title, assignment.descr, assignment.subdate, assignment.ormark, assignment.tmark, assignment.aid], function(err, status) {
        if(err) {
            res.render('assignment_edit', { title: 'Assignment - Edit', message:'Update failed! Check the values again!',  assignment: assignment});

        } else {
            res.redirect('/assignment/');
        }
    });
});

module.exports = router;
  