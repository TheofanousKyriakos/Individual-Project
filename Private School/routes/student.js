var express = require('express');
var router = express.Router();
var dbconnection = require('../lib/db');
var Student = require('../models/student');



router.get('/:message?', function(req, res, next) {
    const query = "SELECT * FROM student";
    var fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;

    dbconnection.query(query, function(err, rows) {

        if(err) {
            res.render('student', { title: 'Student - ERROR', student: '', message: req.params.message });
        } else {
            res.render('student', { title: 'Student', student:rows, message: req.params.message, url: fullUrl });
        }
    });
});


router.get('/add/student/', function(req, res, next) {
    res.render('students_new', { title: 'Students - Add New', message:'' });
});


router.post('/add/student/', function(req, res, next) {
    let student = new Student(undefined, req.body.sfname, req.body.slname, req.body.sdob, req.body.tfees);
    const query2 = `INSERT INTO student(sfname, slname, sdob, tfees) VALUES('${student.sfname}', '${student.slname}', '${student.sdob}', '${student.tfees}');`;
    dbconnection.query(query2, function(err, status) {

        if(err) {
            res.render("students_new", { title: 'Student - Add New', message: "Error inserting data to the database!" });
        } 

        else {

            res.redirect('/student/');
        }

    });
});


router.get('/delete/student/:sid', function(req, res, next) {
    
    var query = "DELETE FROM `student` WHERE `sid` = ?";
    const studentId = req.params.sid;
    
    dbconnection.execute(query, [studentId], function(err, result, fields) {
        // console.log(err);
        if(err) {

        } else {
           
            res.redirect('/student/');        
        }
    });
});


router.get('/edit/student/:sid', function(req, res, next) {
    const studentId = req.params.sid;
    var query = "SELECT * FROM `student` WHERE `sid` = ?";
    dbconnection.execute(query, [studentId], function(err, result, fields) {
        // console.log(result[0]);
        let student = new Student(result[0].sid, result[0].sfname, result[0].slname, result[0].sdob, result[0].tfees);
        // console.log(student);
        res.render('student_edit', { title: 'Student - Edit', message:'',  student: student});
    });
});


router.post('/update', function(req, res, next) {
    let student = new Student(req.body.sid, req.body.sfname, req.body.slname, req.body.sdob, req.body.tfees);
 
    const query = "UPDATE `student` SET `sfname` = ?, `slname` = ?, `sdob` = ?, `tfees` = ? WHERE `sid` = ?;";
    dbconnection.execute(query, [student.sfname, student.slname, student.sdob, student.tfees, student.sid], function(err, status) {
        if(err) {
            res.render('student_edit', { title: 'Student - Edit', message:'Update failed! Check the values again!',  student: student});

        } else {
            res.redirect('/student/');
        }
    });
});

module.exports = router;
  
