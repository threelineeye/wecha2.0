<template>
    <div class="page-head">
        <!-- 顶部标题子组件 -->
        <span>{{leftTitle}}</span>
        <div class="right-head" @click="search">
            <div class="search-div">
                <img :src="rightFirstImg" alt="#">
            </div>
            <div class="add-div" @click="add">
                <img :src="rightLastImg" alt="#">
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name:"TitleBar",
    props:{
        leftTitle:{default:""},
        rightFirstImg:{default:""},
        rightLastImg:{default:""},
        search:{type:Function},
        add:{type:Function},
    }
}
</script>

<style scoped>
    .page-head{
        display:flex;
        position:fixed;
        z-index:999;
        width:100%;
        justify-content: space-between;
        align-items: center;
        padding:0 7px;
        background-color:#EDEDED;
        color:#000;
        font-size:19px;
        height: 48px;
        top:0px;
    }
    .page-head>span{
        margin-left:10px;
        font-weight: 500;
        letter-spacing: 3px;
    }
    .right-head{
        display:flex;
        justify-content: space-between;
        align-items: center;
    }
    .right-head img{
        margin:0 12px;
        cursor:pointer;
        width:26px;
    }
</style>
