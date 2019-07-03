<template>
    <div class="setting">
        <mt-header >
            <router-link to="/" slot="left">
                <mt-button icon="back">设置</mt-button>
            </router-link>
        </mt-header>
        <mt-cell title='账号与安全' class="selectbar" style="margin-bottom:10px;">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='新消息提醒' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='勿扰模式' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='聊天' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='隐私' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='通用' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='关于微信' class="selectbar" style="margin:10px 0;">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='帮助与反馈' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='插件' class="selectbar" style="margin-bottom:10px;position:relative;">
            <img src="@/assets/right.png" alt="#" width="25">
            <img slot="icon" src="@/assets/bulb.png" alt="#" style="position:absolute;left:50px;top:16px;">
        </mt-cell>
        <mt-cell title='切换账号' class="selectbar">
            <img src="@/assets/right.png" alt="#" width="25">
        </mt-cell>
        <mt-cell title='退出' class="selectbar" @click.native="exit">
            <img src="@/assets/right.png" alt="#" width="25" >
        </mt-cell>
        <div :class="gray" @click="grayexit"></div>
        <mt-popup v-model="popupVisible" position="bottom" modal class="popup">
            <ul>
                <li @click="loginout"><img src="@/assets/exitman.png" alt="#">退出登录</li>
                <li @click="closevx" ><img src="@/assets/exiton.png" alt="#">关闭微信</li>
            </ul>
        </mt-popup>
    </div>
</template>
<script>
export default {
    data(){
        return {
            popupVisible:false,
            gray:{
                graybc:false
            }
        }
    },
    methods:{
        exit(){
            this.popupVisible=true;
            this.gray.graybc=true;
        },
        grayexit(){
            this.popupVisible=false;
            this.gray.graybc=false;

        },
        closevx(){
            window.location.href='';
            window.close()
        },
        loginout(){
            this.axios.get('exit').then(result=>{
                this.$toast({
                    message:result.data.msg,
                    duration:400,
                });
                setTimeout(()=>{
                    this.$router.push('/');
                },500)
            })
        }
    }
}
</script>
<style scoped>
    .setting{
        position: relative;
        overflow: hidden;
    }
    .selectbar{
        padding: 2px 2px;
        font-size: 20px;
        color: #000;
        border-bottom: 1px solid #d9d9d9;
        cursor: pointer;
    }
    .graybc{
        position: absolute;
        top:0;
        z-index: 2000;
        width: 100%;
        height: 100%;
        background-color: #000;
        opacity: 0.3;
    }
    .popup{
        position:absolute;
        width:100%;
        background-color:#fff;
        text-align: left;
        border-top-left-radius: 10px; 
        border-top-right-radius: 10px; 
        bottom: 0;
        z-index: 2200;
    }
    .popup li{
        margin:20px 60px;
        font-size: 18px;
        cursor: pointer;
    }
    .popup li img{
        position: absolute;
        width:24px;
        left:15px;
        top: 18px;
    }
    .popup li:last-child img{
        top: 60px
    }
</style>
<style>
    .mint-header{
        background-color: #EDEDED !important;
        color: #000 !important;
        padding-top: 10px!important;
        font-size: 18px !important;
        height: 100%!important;
    }
</style>
