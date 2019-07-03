<template>
    <div class="page-tabbar">
        <div class="page-wrap">
            <!-- 标题子组件 -->
            <titlebar :class="topbar"
            :leftTitle="leftTitle"
            :rightFirstImg="require('@/assets/search.png')"
            :rightLastImg="require('@/assets/addition.png')"
            :search="search"
            :add="add"></titlebar>
            <!-- 48px占位 -->
            <div style="height:48px;" :class="topbar"></div>
            <!-- 切换面板 -->
            <mt-tab-container v-model="selected"  class="page-tabbar-container">
                <mt-tab-container-item id="msg">
                    <message></message>
                </mt-tab-container-item>
                <mt-tab-container-item id="contacts">
                    <my-contact></my-contact>
                </mt-tab-container-item>
                <mt-tab-container-item id="find">
                    <my-find></my-find>
                </mt-tab-container-item>
                <mt-tab-container-item id="me">
                    <my-tab></my-tab>
                </mt-tab-container-item>
            </mt-tab-container>
            <!-- tabbar列表 -->
            <mt-tabbar v-model="selected" fixed>
                <mt-tab-item id="msg" @click.native="changeState(0)">
                    <tabbar-icon
                    :selectedImage="require('@/assets/ic_weixin_selected.png')"
                    :normalImage="require('@/assets/ic_weixin_normal.png')"
                    :focused="currentIndex[0].isSelect"></tabbar-icon>微信
                </mt-tab-item>
                <mt-tab-item id="contacts" @click.native="changeState(1)">
                    <tabbar-icon
                    :selectedImage="require('@/assets/ic_contacts_selected.png')"
                    :normalImage="require('@/assets/ic_contacts_normal.png')"
                    :focused="currentIndex[1].isSelect"></tabbar-icon>通讯录
                </mt-tab-item>
                <mt-tab-item id="find" @click.native="changeState(2)">
                    <tabbar-icon
                    :selectedImage="require('@/assets/ic_find_selected.png')"
                    :normalImage="require('@/assets/ic_find_normal.png')"
                    :focused="currentIndex[2].isSelect"></tabbar-icon>发现
                </mt-tab-item>
                <mt-tab-item id="me" @click.native="changeState(3)">
                    <tabbar-icon
                    :selectedImage="require('@/assets/ic_me_selected.png')"
                    :normalImage="require('@/assets/ic_me_normal.png')"
                    :focused="currentIndex[3].isSelect"></tabbar-icon>我的
                </mt-tab-item>
            </mt-tabbar>
        </div>
    </div>
</template>

<script>
// 引入子组件
import titlebar from './common/TitleBar'
import message from './common/MessageList'
import tabbarIcon from './common/TabBarIcon'
import myTab from './common/My_tab'
import myContact from './common/Contact'
import myFind from './common/Find'

export default {
    data(){ 
        return { 
            title:['微信','通讯录','发现'],
            leftTitle:'微信',
            // 面板中显示子组件id
            selected:"msg",
            // 创建数组保存图片焦点状态
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false},
            ],
            id:["msg","contacts","find","me"],
            list:[],
            topbar:{titlebar:false}
        }
    },
    components:{
        titlebar,
        message,
        tabbarIcon,
        myTab,
        myContact,
        myFind,
    },
    methods:{
        search(){},
        add(){},
        changeState(i){
            // 每次选择改变titlebar的名字
            this.leftTitle=this.title[i];
            this.selected = this.id[i];
            // 对所有的状态变为false
            for(var j=0;j<this.currentIndex.length;j++){
                this.currentIndex[j].isSelect = false;
            }
            // 给触发事件的状态显示true
            this.currentIndex[i].isSelect = true;
            // 判断i=3即点击到'我的'时隐藏上面的titlebar
            if(i>=3){
                this.topbar.titlebar=true;
            }else{
                this.topbar.titlebar=false;
            }
        }
    },
    created(){
        var url = "msgs";
        // 发送ajax请求
        this.axios.get(url).then(result=>{
            this.list = result.data.data;
            // 判断登录状态，没登录就跳转到登录界面
            if(this.list.length==0){
                this.$router.push('/login')
            }
        })
    }
}
</script>

<style scoped>
    .page-wrap{
        padding-bottom: 58px;
    }
    /* 修改tabbar默认字体颜色 */
    .mint-tabbar>.mint-tab-item{color:#999999}
    .mint-tabbar>.mint-tab-item.is-selected{background-color:transparent;color:#09bb07 }
    .titlebar{display:none}
</style>
