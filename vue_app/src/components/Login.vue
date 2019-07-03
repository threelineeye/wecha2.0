<template>
    <div class="container">
        <div class="tipslogin">
            <span>您需要登录才能继续访问</span>
            <span class="closeSpan" @click="close">关闭</span>
        </div>
        <!-- logo图片 -->
        <div class="imgDiv">
            <img src="../assets/wx.png" alt="logo" class="logo"/>
        </div>
        <!-- 操作区域 -->
        <div class="operateDiv myinput">
            <!-- 账号 -->
            <mt-field :placeholder="accountPlaceholder" v-model="uname" class="mint-cell-wrapper"></mt-field>
            <!-- 密码 -->
            <mt-field type="password" placeholder="请输入密码" v-show="isUserAccount" v-model="upwd" class="mint-cell-wrapper myinput"></mt-field>
            <!-- 短信验证码 -->
            <mt-field placeholder="短信校验码" v-model="upwd" v-show="!isUserAccount" class="mint-cell-wrapper myinput">
                <a href="javascript:;" class="getCode sendmsg">获取短信校验码</a>
            </mt-field>
            <!-- 免费注册 -->
            <!-- 登录和切换登录方式 -->
            <div class="btn_switch">
                <a @click="changeLoginMethod" class="getCode switchLogin">{{defaultAccountText}}</a>
                <mt-button size="large" class="mybutton" @click="login">登录</mt-button>
            </div>
        </div>
        <!-- 服务区域 -->
        <div class="vhelps">
            <span><a href="javascript:;" class="vhelp">找回密码</a></span>
            <span>|<a href="javascript:;" class="vhelp">紧急冻结</a></span>
            <span>|<a href="javascript:;" class="vhelp">微信安全中心</a></span>
        </div>
    </div>
</template>

<script>
import querystring from 'querystring'
export default {
    data(){
        return {
            accountPlaceholder:"请填写微信号/QQ号/邮箱",
            uname:"",
            upwd:"",
            defaultAccountText:"用手机号登录",
            // 是否是账户方式
            isUserAccount:true,
            msg:'请输入密码',
        }
    },
    methods:{
        login(){
            if(!this.uname){
                this.$messagebox({
                    title:"",
                    message:"请输入用户名"
                })
            }else if(!this.upwd){
                this.$messagebox("","请输入密码")
            }else{
                var uname = this.uname,
                upwd = this.upwd;
                // 正则验证
                var reg_uname = /^[a-zA-Z0-9]{3,10}$/,
                reg_upwd = /^\w{6,10}$/;
                if(!reg_uname.test(uname)){
                    this.$toast("用户名格式不正确");
                    return;
                }
                if(!reg_upwd.test(upwd)){
                    this.$toast("密码格式不正确");
                    return;
                }
                // 发送ajax请求
                var url = "login";
                var data = {uname,upwd};
                // {headers:{'Content-Type':'application/x-www-form-urlencoded'}}
                this.axios({
                    url,
                    method:'post',
                    data,
                    transformRequest:[function(data){
                        // let ret = "";
                        // for (let it in data){
                        //     ret += encodeURIComponent(it) + '=' +encodeURIComponent(data[it]) + '&'
                        // }
                        // return ret
                        data = querystring.stringify(data);
                        return data;
                    }],
                    headers:{'Content-Type':'application/x-www-form-urlencoded'}
                }).then(result=>{
                    // console.log(result.data.data.uname)
                    var code = result.data.code;
                    var msg = result.data.msg;
                    if(code==-1){
                        this.$toast(msg)
                    }else{
                        this.$router.push("/loginbg")
                    }
                })
            }
        },
        close(){
          this.$router.push("/");
        },
        changeLoginMethod(){
        // console.log("123")
            if(this.isUserAccount){
                this.accountPlaceholder="请输入手机号码";
                this.defaultAccountText="用微信号/QQ号/邮箱登录";
                this.isUserAccount=!this.isUserAccount;
                this.uname="";
                this.upwd="";
                this.msg='请输入手机验证码';
            }else{
                this.accountPlaceholder="手机号/邮箱/会员名";
                this.defaultAccountText="用手机号登录";
                this.isUserAccount=!this.isUserAccount;
                this.uname="";
                this.upwd="";
                this.msg='请输入密码';
            }
        }
    }
}
</script>

<style scoped>
    /* 你需要登录才能继续仿问的布局样式 */
    .tipslogin {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 52px;
        background: rgb(238, 230, 238);
        padding-left: 20px;
        padding-right: 20px;
    }
    /* 半闭样式 */
    .closeSpan {
        color: rgb(153, 153, 153)
    }
    /* 图片 logo 根样式 */
    .imgDiv {
        display: flex;
        justify-content: center;
    }
    /* 图片样式 */
    .logo{
        width: 70px;
        height: 70px;
        margin-top:20px
    }
    /* 上面的线隐藏 */
    .mint-cell-wrapper  {
        background-image: linear-gradient(180deg, #fff, #fff 0%, transparent 0%);
    }
    /* 输入框底边框样式 */
    .mint-cell-wrapper  {
        border-bottom: 1px solid #09bb07;
        padding-left:0px;
        border-radius: 5px;
    }

    /* 修改按钮按钮下的默认颜色 */
    .mint-button::after {
        background-color: transparent;
    }
    /* 操作区域的样式*/
    .operateDiv {
        padding-left: 20px;
        padding-right: 20px;
    }
    /* 输入框边距 */
    .myinput {
        margin-top: 30px;
    }
    .btn_switch{
        padding-top: 10px;
    }
    /* a标签字体颜色 */
    .getCode {
        color:#0aa1ed;
        font-size: 17px;
        padding-left: 7px;
        text-decoration:none;
    }
    /* 切换登录 */
    .switchLogin{
        font-size: 16px;
        margin-left: -8px;
        color: rgb(20, 100, 120);
    }
    /* 获取短信验证码 */
    .sendmsg{
        border-left: 1px solid #b5b5b5;
    }
    /* 免费注册根样式 */
    .registerDiv {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    /* 免费注册字体样式*/
    .registerDiv span {
        color: #555;
    }
    /* 登录短信验证按钮边距 */
    .mybutton {
        margin-top: 20px;
    }
    /* 修改默认 butoon 的样式 达到和淘宝登录一样 */
    .mint-button--default {
        background-color: #09bb07;
        border-radius: 25px;
        color: #fff;
        height: 48px;
    }
    /* 同上 */
    .mint-button--primary {
        border-radius: 25px;
        height: 48px;
        background-color: transparent;
        border: 1px solid #09bb07;
        color: #0aa1ed
    }
    /* 修改默认弹框的样式，达到基本和淘宝的效果一样 */
    .mint-msgbox{
        border-radius: 8px;
        width: 70%
    }
    /* 弹出框内容样式 */
    .mint-msgbox-content {
        min-height: 50px;
        font-size: 18px;
    }
    /* 弹出内容居中 */
    .mint-msgbox-message{
        line-height: 50px;
    }
    /* 弹出框确定按钮样式 */
    .mint-msgbox-btns{
        height: 60px;
    }
    /* 弹出框确定按钮字体 */
    .mint-msgbox-confirm {
        color: #f40;
    }
    .vhelps{
        text-align: center;
        margin-top: calc(120% - 350px);
    }
    .vhelp{
        font-size: 14px;
        margin: 0 5px;
        color: rgb(20, 100, 120);
    }
</style>
<style>
    select, textarea, input[type='text'], input[type='search'], input[type='password'], input[type='datetime'], input[type='datetime-local'], input[type='date'], input[type='month'], input[type='time'], input[type='week'], input[type='number'], input[type='email'], input[type='url'], input[type='tel'], input[type='color']{
        border:none !important;
        padding:10px 8px !important;
    }
</style>
