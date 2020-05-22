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
        if (data.length) {
          res.send({ code: 0, msg: '注册失败,用户已存在' })
        } else {
          mysql.table('userinfo').add({ username, password, identity })
            .then(function (UserId) {
              //如果插入成功，返回插入的id
              res.cookie('user_id', UserId, { maxAge: 1000 * 60 * 24 * 24 })
              res.send({ code: 1, msg: '注册成功', user_id: UserId, identity })
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
      } else {
        res.send({ code: 0, msg: '登录失败，用户名或密码出错！' })
      }
    })
    .catch(function (e) {
    });
})

router.get('/getchatList', function (req, res) {
  let { user_id } = req.cookies
  if (!user_id) {
    res.send({ code: 0, msg: '请登录' })
  } else {
    mysql.table('userinfo').where({ identity: ['!=', 3] }).field(['id', 'username', 'head']).select()
      .then(result => {
        let users = {}
        if (result.length) {
          result.forEach(element => {
            users[element.id] = { username: element.username, head: element.head }
          });
        }else{
          res.send({code:0,msg:'用户获取失败',result})
        }
        mysql.table('messages').where({ from: user_id, to: user_id, _logic: 'OR' }).select().then(data => {
          if (data.length) {
            res.send({ code: 1, msg: '消息列表获取成功', chats: { users, data } })
          }else{
            res.send({code:0,msg:'消息获取失败',data})
          }
        }).catch(err => {
          return new Error(err)
        })
      }).catch(err => {
        return new Error(err)
      })

  }
})

router.post('/readmsg', function (req, res) {
  let { from } = req.body
  let { to } = req.cookies
  mysql.table('message').update({ from, to, read: 1 }).then(info => {
    if (info) {
      res.send({ code: 1, msg: '更新已读', info })
    }
  })
})
module.exports = router;
