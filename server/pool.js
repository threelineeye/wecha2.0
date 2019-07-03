// 创建mysql连接池
const mysql = require('mysql');
var pool = mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'',
    database:'wechat',
    connectionLimit:15
});
// 导出连接池
module.exports = pool;