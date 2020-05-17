var express = require('express');
var router = express.Router();
let mysql = require('../db/db_test')

/* GET users listing. */
router.post('/userDetail', function (req, res, next) {
  let obj = { position, head, desc, user_id, company, birth, gender, exprience, age, salary, gratuated, address, email, mobile, nickname } = req.body
  console.log(obj)
  let isbeauty = 1
  mysql.table('userinfo').where({ id: user_id }).update({ nickname, position, head, desc, isbeauty, company, birth, gender, exprience, age, salary, gratuated, address, email, mobile })
    .then(success => {
      if (success) {
        obj.isbeauty = isbeauty
        if (company) {
          mysql.table('companys').add({ user_id, company, ceo: nickname, mobile, email, address })
            .then(insertId => {
              console.log(insertId)
              if (insertId) {
                obj.org_id = insertId
                res.send({ code: 1, msg: '信息添加成功', data: obj })
              }
            })
        } else {
          res.send({ code: 1, msg: '信息添加成功', data: obj })
        }

      } else {
        res.send({ code: 0, msg: '信息添加失败', success })
      }
    }).catch(err => {
      return new Error(err)
    })
});

router.get('/getuser', function (req, res) {
  let { user_id } = req.cookies
  if (!user_id) {
    res.send({ code: 0, msg: '请登录' })
  } else {
    mysql.table('userinfo').where({ id: user_id }).find()
      .then(data => {
        data.user_id = user_id
        if (data.identity == 1) {
          mysql.table('companys').where({ user_id }).find()
            .then(data2 => {
              if (data2) {
                data['org_id'] = data2.id
                console.log('hahahaha')
                res.send({ code: 1, msg: '获取成功', data })
              } else {
                res.send({ code: 0, msg: '公司不存在' })
              }
            })
            .catch(err => {
              return new Error(err)
            })
        } else {
          res.send({ code: 1, msg: '获取成功', data })
        }
      })
      .catch(err => {
        return new Error(err)
      })
  }

})

router.post('/publishPosition', function (req, res) {
  let { user_id } = req.cookies
  let obj = { org_id, company, position, intro, category, experience, salary, education, address, recruiter, recruiterPosition } = req.body
  if (!user_id) {
    res.send({ code: 0, msg: '请登录' })
  } else {
    mysql.table('positions').add(obj).then(insertId => {
      if (insertId) {
        res.send({ code: 1, msg: '发布成功', insertId, ispublished: true })
      } else {
        res.send({ code: 0, msg: '发布失败', insertId })
      }
    }).catch(err => {
      return new Error(err)
    })
  }
})

router.get('/getHomelist', function (req, res) {
  let { identity } = req.body
  let { user_id } = req.cookies
  if (!user_id) {
    res.send({ code: 0, msg: '请登录' })
  } else {
    mysql.table('positions').select().then(data => {
      if (data.length) {
        res.send({ code: 1, msg: '获取成功', data })
      } else {
        res.send({ code: 0, msg: '获取失败' })
      }

    })

  }
})

module.exports = router;
