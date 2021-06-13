var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Course = require('../models/course');



router.get('/:message?', function(req, res, next) {
    const query = "SELECT * FROM course";
    var fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;

    dbconnection.query(query, function(err, rows) {

        if(err) {
            res.render('course', { title: 'Course - ERROR', course: '', message: req.params.message });
        } else {
            res.render('course', { title: 'Course', course:rows, message: req.params.message, url: fullUrl });
        }
    });
});


router.get('/add/course/', function(req, res, next) {
    res.render('course_new', { title: 'Course - Add New', message:'' });
});


router.post('/add/course/', function(req, res, next) {
    let course = new Course(undefined, req.body.ctitle, req.body.cstream, req.body.ctype, req.body.sdate, req.body.edate);
    const query2 = `INSERT INTO course(ctitle, cstream, ctype, sdate, edate) VALUES('${course.ctitle}', '${course.cstream}', '${course.ctype}', '${course.sdate}', '${course.edate}');`;
    dbconnection.query(query2, function(err, status) {
        
        if(err) {
            res.render("course_new", { title: 'Course - Add New', message: "Error inserting data to the database!" });
        } 

        else {

            res.redirect('/course/');
        }

    });
});


router.get('/delete/course/:cid', function(req, res, next) {
    
    var query = "DELETE FROM `course` WHERE `cid` = ?";
    const courseId = req.params.cid;
    
    dbconnection.execute(query, [courseId], function(err, result, fields) {
        // console.log(err);
        if(err) {

        } else {
           
            res.redirect('/course/');        
        }
    });
});


router.get('/edit/course/:cid', function(req, res, next) {
    const courseId = req.params.cid;
    var query = "SELECT * FROM `course` WHERE `cid` = ?";
    dbconnection.execute(query, [courseId], function(err, result, fields) {
        // console.log(result[0]);
        let course = new Course(result[0].cid, result[0].ctitle, result[0].cstream, result[0].ctype, result[0].sdate, result[0].edate);
        // console.log(trainer);
        res.render('course_edit', { title: 'Course - Edit', message:'',  course: course});
    });
});


router.post('/update', function(req, res, next) {
    let course = new Course(req.body.cid, req.body.ctitle, req.body.cstream, req.body.ctype, req.body.sdate, req.body.edate);

    const query = "UPDATE `course` SET `ctitle` = ?, `cstream` = ?, `ctype` = ?, `sdate` = ?, `edate` = ? WHERE `cid` = ?;";
    dbconnection.execute(query, [course.ctitle, course.cstream, course.ctype, course.sdate, course.edate, course.cid], function(err, status) {
        if(err) {
            res.render('course_edit', { title: 'Course - Edit', message:'Update failed! Check the values again!',  course: course});

        } else {
            res.redirect('/course/');
        }
    });
});

module.exports = router;
  