<template>
    <div class="container" style="cursor: pointer">
        <div class="camera"><img src="@/assets/xiangji.png" alt="#"></div>
        <div class='titlebar'>
            <div class="leftImg">
                <img src="@/assets/ic_common.png" alt="#" width="60">
                <div class="leftMsg">
                    <span>{{name}}-jumping</span>
                    <span>微信号：{{name}}-123</span>
                </div>
            </div>
            <div class="rightImg">
                <img src="@/assets/ic_qr_code.png" alt="#" width="20">
                <img src="@/assets/right.png" alt="#" width="25">
            </div>
        </div>
        <div >
            <mt-cell title='支付' class="selectbar" style="margin:10px 0;">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/wechat_pay.png" alt="#" width="28" height="32" style="margin-right:12px">
            </mt-cell>
            <mt-cell title='收藏' class="selectbar">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/icon_me_collect.png" alt="#" width="30" height="30" style="margin-right:10px">
            </mt-cell>
            <mt-cell title='相册' class="selectbar">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/icon_me_photo.png" alt="#" width="30" height="30" style="margin-right:10px">
            </mt-cell>
            <mt-cell title='卡包' class="selectbar">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/icon_me_card.png" alt="#" width="30" height="30" style="margin-right:10px">
            </mt-cell>
            <mt-cell title='表情' class="selectbar">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/icon_me_smail.png" alt="#" width="30" height="30" style="margin-right:10px">
            </mt-cell>
            <mt-cell title='设置' class="selectbar" style="margin:10px 0;" @click.native="setting">
                <img src="@/assets/right.png" alt="#" width="25">
                <img slot="icon" src="@/assets/icon_me_setting.png" alt="#" width="30" height="30" style="margin-right:10px">
            </mt-cell>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            name:"tom"
        }
    },
    // created() {
    //     this.axios.get("info").then(result=>{
    //         console.log(result)
    //         // this.name = result.data.data;
    //     })
    // },
    methods:{
        setting(){
            this.$router.push('/setting');
        }
    }
}
</script>
<style scoped>
    .titlebar{
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 15px;
    }
    .leftImg{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .leftImg img{
        border-radius: 8px;
    }
    .leftMsg{
        display: flex;
        height: 100%;
        justify-content: space-around;
        flex-direction: column;
        margin-left: 12px;
    }
    .leftMsg span:first-child{
        margin-top: 2px;
        font-size: 20px
    }
    .leftMsg span:last-child{
        margin-top: 15px;
        font-size: 14px;
        color:gray;
    } 
    .rightImg{
        display:flex;
        align-items: center;
        align-self: flex-end;
    }
    .camera{
        width: 100%;
        height: 80px;
        background-color: #fff;
    }
    .camera img{
        position: fixed;
        z-index: 999;
        left: calc(100% - 40px);
        top: 40px;
        width: 25px;
    }
    .selectbar{
        padding: 4px 2px;
        font-size: 20px;
        color:#000;
        border-bottom: 1px solid #d9d9d9

    }
</style>
