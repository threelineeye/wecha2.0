// 引入express body-parser cors express-session模块
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const session = require('express-session');

// 引入连接池
var pool = require('./pool.js');

// 创建web服务器 设置端口3000
var server = express();
server.listen(3000);
// 托管静态资源
server.use(express.static('img'));
// 使用body-parser中间件
server.use(bodyParser.urlencoded({
    extended:false
}));

// 处理跨域请求
server.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080'],
    credentials:true
}));

// 添加session功能
server.use(session({
    secret:'128位字符串',
    cookie:{maxAge:30*60*1000},//过期时间0.5h
    resave:false,//cookie过期不更新数据
    saveUninitialized:true//保存初始化数据
}));

// 1 登录
server.post('/login',(req,res)=>{
    // 接收脚手架参数
    var {uname,upwd} = req.body;
    // sql语句
    var sql = "SELECT id,uname,email,phone,avatar,gender FROM v_login where uname=? AND upwd=md5(?)";
    // 返回结果
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) console.log(err);
        if(result.length>0){
            // 用户信息保存到session中
            req.session.uid = result[0].id;
            // console.log(result[0].uname)
            // console.log(req.session);
            res.send({code:1,msg:"登录成功",data:result[0]});
        }else{
            res.send({code:-1,msg:"账号或密码错误"});
        }
    })
})

// 2 微信信息内容
server.get('/msgs',(req,res)=>{
    // console.log(2222)
    // console.log(req.session)
    var uid = req.session.uid;
    var sql = "SELECT id,img,title,subtitle,time FROM chat_info WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) console.log(err);
        // console.log(result)
        res.send({code:1,msg:"获取成功",data:result});
    })
})

// 3 通讯录信息 
server.get('/addr',(req,res)=>{
    var uid=req.session.uid;
    var sql="SELECT id,img,title FROM address_list WHERE uid=? ORDER BY title ASC";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        console.log(err);
        res.send({code:1,msg:"获取成功",data:result})
    })
})

// 4 用户注销
server.get('/exit',(req,res)=>{
    req.session.uid = null;
    res.send({code:0,msg:'注销成功'})
})

// 5 组件中获得登录用户信息
// server.get("/info",(req,res)=>{
//     var $id = req.session.uid;
//     if($id!=undefined){
//         var sql="SELECT uname,email,phone FROM v_login WHERE uid=?";
//         pool.query(sql,[$id],(err,result)=>{
//             if(err) throw err;
//             res.send(result)
//             console.log(result)
//         })
//     }
// })