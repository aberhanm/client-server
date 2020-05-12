let express = require('express');
let router = express.Router();
let mysql = require('../db/db_test')

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/register', function (req, res) {
  let { username, password, identity } = req.body
  if (username === 'admin') {
    //注册失败已存在
    res.send({ code: 0, msg: '注册失败,用户已存在' })
  } else {//组测成功
    //SELECT * FROM table;
    mysql.table('userinfo').field('username').where({ username }).select()
      .then(function (data) {
        console.log(data)
        if (data.length) {
          res.send({ code: 0, msg: '注册失败,用户已存在' })
        } else {
          console.log('s')
          mysql.table('userinfo').add({ username, password, identity })
            .then(function (UserId) {
              //如果插入成功，返回插入的id
              res.cookie('user_id', UserId, { maxAge: 1000 * 60 * 24 * 24 })
              res.send({ code: 1, msg: '注册成功', user_id: UserId })
            })
            .catch(function (err) {
              //插入失败，err为具体的错误信息
              console.log(err)
            })
        }
      })
      .catch(function (e) {
        console.log(e);
      });
  }
})

router.post('/login', function (req, res) {
  let { username, password } = req.body
  res.setHeader('Content-Type', 'application/json');
  res.setHeader('Cookie', ['type=ninja', 'language=javascript']);
  mysql.table('userinfo').where({ username, password }).find()
    .then(function (data) {
      if (data.id) {
        res.cookie('user_id', data.id, { maxAge: 1000 * 60 * 24 * 24 })
        res.send({ code: 1, msg: '登录成功', user_id: data.id, identity: data.identity, username: data.username, isbeauty: data.isbeauty })
      }else{
        res.send({ code: 0, msg: '登录失败，用户名或密码出错！'})
      }
    })
    .catch(function (e) {
      console.log(e);
    });
})

module.exports = router;
