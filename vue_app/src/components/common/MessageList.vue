<template>
    <div>
        <message v-for="(item,index) of list" :key="index" :itemclass="itemclass[index]"
        :id="item.id"
        :img="'http://127.0.0.1:3000/'+item.img"
        :title="item.title"
        :subtitle="item.subtitle"
        :time="item.time"
        :itemClick="clickItem" class="itemStyle"></message>
    </div>
</template>

<script>
import message from './Message.vue'
export default {
    data(){
        return {
            list:[],
            itemclass:[]
        }
    },
    components:{
        message
    },
    created(){
        this.loadMsg();
    },
    methods:{
        loadMsg(){
            var url = "msgs";
            // 发送ajax请求
            this.axios.get(url).then(result=>{
                this.list = result.data.data;
                for(var i=0;i<this.list.length;i++){
                    this.list[i].id=i
                }
                // console.log(this.list);
            })
        },
        clickItem(n){
            // console.log(n);
            // 创建一个长度为n的空数组，作为每次点击重新创建
            this.itemclass=new Array(n+1);
            // console.log(this.itemclass)
            // 每次单击获得的n-1与<message>遍历中的i一致
            // 在数组n-1位置添加{itembg:true}
            this.itemclass.splice(n,1,{itembg:true});
            setTimeout(()=>{
                this.itemclass.splice(n,1,{itembg:false});
            },1000);
        }
    },
}
</script>

<style scoped>
    .itemStyle{
        padding:5px;
        border-bottom:1px solid #d9d9d9;
    }
    .itembg{
        background-color:rgba(0,0,0,.1);
    }
</style>
