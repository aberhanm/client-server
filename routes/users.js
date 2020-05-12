var express = require('express');
var router = express.Router();
let mysql = require('../db/db_test')

/* GET users listing. */
router.post('/userDetail', function (req, res, next) {
  let { position, head, desc, user_id,company,birth,gender,exprience,age,salary,gratuated ,address,email,mobile,nickname} = req.body
  let isbeauty = 1
  mysql.table('userinfo').where({ id: user_id }).update({nickname, position, head, desc,isbeauty,company,birth,gender,exprience,age,salary,gratuated,address,email,mobile })
    .then(success => {
      if (success) {
        res.send({ code: 1, msg: '信息添加成功' })
      } else {
        res.send({ code: 0, msg: '信息添加失败',success })
      }
    }).catch(err=>{
      return new Error(err)
    })
});

module.exports = router;
