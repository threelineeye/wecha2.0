SET NAMES UTF8;
DROP DATABASE IF EXISTS wechat;
CREATE DATABASE wechat CHARSET=UTF8;
USE wechat;

/** 用户登录信息 **/
DROP TABLE IF EXISTS v_login;
CREATE TABLE v_login (
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(25),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16),
    avatar VARCHAR(128),#头像路径
    gender INT #性别 0-女 1-男
);
INSERT INTO v_login VALUES(null,'tom',md5('123456'),'tom@qq.com','13566784388','avatar/default.png','1');
INSERT INTO v_login VALUES(null,'jerry',md5('123456'),'jerry@qq.com','15866766688','avatar/default.png','0');

/** 完成微信聊天信息功能 **/
DROP TABLE IF EXISTS chat_info;
CREATE TABLE chat_info (
    id INT PRIMARY KEY AUTO_INCREMENT,
    img  VARCHAR(128),
    title  VARCHAR(64),
    subtitle VARCHAR(128),
    time VARCHAR(10),
    uid INT
);
INSERT INTO chat_info VALUES(null,'defult_group.png','微信支付','微信支付凭证','13:25',1);
INSERT INTO chat_info VALUES(null,'icon/tengxun.png','腾讯新闻','习近平给澳门小学回应','08:15',1);
INSERT INTO chat_info VALUES(null,'25.jpeg','王富贵','出来干酒啊','13:25',1);
INSERT INTO chat_info VALUES(null,'icon/xuebitu_QQyouxiangyanzhengfuben.png','QQ邮箱','QQ邮箱管理员提醒您','13:25',1);
INSERT INTO chat_info VALUES(null,'icon/meituan.png','美团','您有一个签到红包待领取','13:25',1);
INSERT INTO chat_info VALUES(null,'27.jpg','刘哥','[视频]','13:25',1);
INSERT INTO chat_info VALUES(null,'icon/4163923-73fcbc45072351d8.jpeg','相亲相爱一家人','妈妈：什么时候回来？','13:25',1);
INSERT INTO chat_info VALUES(null,'26.jpg','小姨妈','[语音通话]','13:25',1);
INSERT INTO chat_info VALUES(null,'28.jpg','queen','嗯嗯 是的','13:25',1);
INSERT INTO chat_info VALUES(null,'icon/douban.png','豆瓣','黑泽明：你将谎言层层叠加','13:25',2);
INSERT INTO chat_info VALUES(null,'icon/dingyuehaotubiao.png','订阅号','凤凰网安徽：直逼40°C...','13:25',1);
INSERT INTO chat_info VALUES(null,'29.jpg','隔壁老王','马上来','13:25',1);
INSERT INTO chat_info VALUES(null,'defult_group.png','支付宝服务','支付宝提醒您，你有一次免费提升花呗额度...','16:30',2);
INSERT INTO chat_info VALUES(null,'defult_group.png','QQ邮箱','您本周有一次在异地的登录，详情请查看http://...a.com','12:30',2);
INSERT INTO chat_info VALUES(null,'25.jpeg','王富贵','出来干酒啊','13:25',2);
INSERT INTO chat_info VALUES(null,'26.jpg','小姨妈','[语音通话]','13:25',2);
INSERT INTO chat_info VALUES(null,'27.jpg','刘哥','[视频]','13:25',2);
INSERT INTO chat_info VALUES(null,'28.jpg','queen','嗯嗯 是的','13:25',2);
INSERT INTO chat_info VALUES(null,'29.jpg','隔壁老王','马上来','13:25',2);
INSERT INTO chat_info VALUES(null,'30.jpg','小老弟','王者荣耀带你飞...','13:25',2);
INSERT INTO chat_info VALUES(null,'31.jpg','中国人寿王经理','最近新出一款社保...','13:25',2);
INSERT INTO chat_info VALUES(null,'32.jpeg','樱木小花道','球场等你呢','13:25',2);
INSERT INTO chat_info VALUES(null,'33.jpg','表妹','帮我带份酸辣粉','13:25',2);



/*通讯录界面*/
/*上层*/
DROP TABLE IF EXISTS address_list;
CREATE TABLE address_list (
    id INT PRIMARY KEY AUTO_INCREMENT,
    img  VARCHAR(128),
    title  VARCHAR(64),
    uid INT
);
INSERT INTO address_list VALUES(null,'icon/icon-test.png','新的朋友',1);
INSERT INTO address_list VALUES(null,'icon/defult-group.png','群聊',1);
INSERT INTO address_list VALUES(null,'icon/biaoqian.png','标签',1);
INSERT INTO address_list VALUES(null,'icon/icon-test.png','公众号',1);

/*下层*/
INSERT INTO address_list VALUES(null,'head portrait/1.jpg','AAA中国移动',1);
INSERT INTO address_list VALUES(null,'head portrait/2.jpg','AAA造型师',2);
INSERT INTO address_list VALUES(null,'head portrait/3.jpeg','AAA牛车',1);
INSERT INTO address_list VALUES(null,'head portrait/4.jpg','八戒',2);
INSERT INTO address_list VALUES(null,'head portrait/','半真半假',1);
INSERT INTO address_list VALUES(null,'head portrait/5.jpeg','Bridget',1);
INSERT INTO address_list VALUES(null,'head portrait/6.jpg','曹操打车',2);
INSERT INTO address_list VALUES(null,'head portrait/7.jpg','朝阳区',1);
INSERT INTO address_list VALUES(null,'head portrait/8.jpg','大哥',2);
INSERT INTO address_list VALUES(null,'head portrait/9.jpg','二师兄',1);
INSERT INTO address_list VALUES(null,'head portrait/10.jpeg','二姐',1);
INSERT INTO address_list VALUES(null,'head portrait/11.jpg','房东',1);
INSERT INTO address_list VALUES(null,'head portrait/12.jpg','高长宝',2);
INSERT INTO address_list VALUES(null,'head portrait/13.jpg','GHOST',1);
INSERT INTO address_list VALUES(null,'head portrait/14.jpg','好人一生平安',1);
INSERT INTO address_list VALUES(null,'head portrait/15.jpeg','合肥通',1);
INSERT INTO address_list VALUES(null,'head portrait/16.jpg','华泰食品',1);
INSERT INTO address_list VALUES(null,'head portrait/17.jpg','Jackey',1);
INSERT INTO address_list VALUES(null,'head portrait/18.jpg','隽星营业厅',2);
INSERT INTO address_list VALUES(null,'head portrait/19.jpg','考拉',1);
INSERT INTO address_list VALUES(null,'head portrait/20.jpg','蓝月',2);
INSERT INTO address_list VALUES(null,'head portrait/21.jpg','MR.chane',1);
INSERT INTO address_list VALUES(null,'head portrait/22.jpg','茉莉花',1);
INSERT INTO address_list VALUES(null,'head portrait/23.jpg','瓶瓶盖盖',2);
INSERT INTO address_list VALUES(null,'head portrait/4.jpg','清风扶杨柳',1);
INSERT INTO address_list VALUES(null,'head portrait/6.jpg','瑞雪',1);
INSERT INTO address_list VALUES(null,'head portrait/19.jpg','三辰',1);
INSERT INTO address_list VALUES(null,'head portrait/7.jpg','撒呕血',2);
INSERT INTO address_list VALUES(null,'head portrait/9.jpg','涛哥',1);