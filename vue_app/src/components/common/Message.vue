<template>
    <div style="background-color:#fff">
        <mt-cell-swipe :right="[{
        content:'删除',
        style:{'background-color':'red',color:'#fff'},
        handler:()=>this.$messagebox('delete')
        }]" :class="itemclass">
            <div class="rootstyle" @click="itemClick(id)" @touchmove="itemClick(id)">
                <div class="msgStyle">
                    <img :src="img" alt="#" class="imgStyle">
                    <div class="rightOfImg">
                        <span class="title">{{title}}</span>
                        <span class="subtitle">{{subtitle}}</span>
                    </div>
                </div>
                <span class="sendTime">{{time}}</span>
            </div>
        </mt-cell-swipe>
    </div>
</template>
<script>
export default {
    props:{
        id:{default:''},
        img:{default:''},
        title:{type:String,default:''},
        subtitle:{type:String,default:''},
        time:{type:String,default:''},
        itemClick:{type:Function},
        itemclass:{type:Object}
    }
}
</script>

<style scoped>
    .rootstyle{
        width:100%;
        position:absolute;
        left:0;top:0;
        display:flex;
        font-size:14px;
        justify-content: space-between;
        align-items: center;
        margin-top:3px;
    }
    .imgStyle{
        width:40px;
        height:40px;
        border-radius: 8px;
    }
    .msgStyle{
        display:flex;
    }
    .rightOfImg{
        display:flex;
        flex-direction: column;
        justify-content: center;
        margin-left: 7px;
        width:90%;
        position:absolute;
        left:40px;
        top:3px;
    }
    .title{
        color:#000;
        font-size:17px;
    }
    .subtitle{
        white-space: nowrap;
        color:gray;
        margin-top: 4px;
        width:85%;
        height:20px;
        overflow: hidden;
    }
    .sendTime{
        margin-right: 10px;
        color:gray;
        align-self: flex-start;
    }
    .itembg{
        background-color:rgba(0,0,0,.1);
    }
</style>
