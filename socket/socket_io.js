let mysql = require('../db/db_test')

module.exports = function (server) {
    const io = require('socket.io')(server)
    io.on('connection', function (socket) {
        console.log('客户端连接服务器');
        const users={}
        socket.on('sendMsg', function (data) {
            let { from, to, msg } = data
            // users[from]={user_id:from,socketID:socket.id}
            let chat_id=[from,to].sort().join('_')
            mysql.table('messages').add({from,to,chat_id,content:msg,create_time:Date.now()}).then(id=>{
                if(id){
                    io.emit('receiveMsg','哈哈哈哈哈哈哈哈哈')
                }
            })
            console.log("服务器接收：", data);
        })
    })
}