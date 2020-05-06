var Mysql = require('node-mysql-promise');
var mysql = Mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'client'
});

module.exports=mysql




// var express = require('express');
// var mysql = require('mysql');
// var conn = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: '123456',
//     database: 'client'
// });
// conn.connect()




// function connection(sql, params = []) {
//     return new Promise((resolve, reject) => {
//         conn.query(sql, params, function (err, result) {
//             if (err) {
//                 reject(err)
//             }
//             resolve(result)
//         })
//     })
// }
// module.exports = connection;
