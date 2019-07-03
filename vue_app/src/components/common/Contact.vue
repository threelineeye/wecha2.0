<template>
  <div class="container">
<!--通讯面板-->
    <mt-index-list>
      <div>   
        <!--通讯头-->   
        <div class="Head">
          <mt-tab-container>
            <mt-tab-container-item>
              <div style=" margin-bottom: 5px;border-bottom:1px solid #ddd;"> 
                <img src="@/assets/ic_new_friends.png" alt="" class="Img">
                <span class="subhead">新的朋友</span>  
              </div>  
              <div>
                <img src="@/assets/ic_group_chat.png" alt=""
                class="Img">
                <span class="subhead">群聊</span>   
              </div>  
              <div>  
                <img src="@/assets/ic_tag.png" alt=""
                class="Img">
                <span class="subhead" >标签</span>  
              </div>
              <div>  
                <img src="@/assets/ic_common.png" alt=""
                class="Img">
                <span class="subhead">公众号</span>   
              </div>  
            </mt-tab-container-item>
          </mt-tab-container>
        </div> 
      </div> 
      <div class="column">
        <mt-index-section  index="A">
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div> 
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>     
        </mt-index-section>
        <mt-index-section index="B">
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
        </mt-index-section>
        <mt-index-section index="C">
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
        </mt-index-section>
        <mt-index-section index="D">
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
          <div>
            <img src="@/assets/wx.png" alt=""> 
            <span class="subhead">新的朋友</span>
          </div>   
        </mt-index-section>
        <mt-index-section index="E">
          <div>
              <img src="@/assets/wx.png" alt=""> 
              <span class="subhead">新的朋友</span>
          </div>   
          <div>
              <img src="@/assets/wx.png" alt=""> 
              <span class="subhead">新的朋友</span>
          </div>   
        </mt-index-section>
      </div>
    </mt-index-list>
  </div> 
</template>
<script>
export default {
  data() {
    return {
        
    }
  }, 
}
</script>
<style scoped>
div{
  position:relative;
  cursor: pointer;
}
.container{
  height: 100%;
  background-color:#fff;
  padding-top:10px;
  padding-left:3px;
}
img{
  width:40px;
  height:40px;
  border-radius: 5px;
}
.subhead{
  position:absolute;
  margin-top:10px;
  margin-left:10px;
}
.Img{
  position:relative;
  width:40px;
  height:40px;
}
.Head{
  margin-left:10px;
  background-color:#fff
}
.Head div+div{
  margin-bottom: 5px;
  border-bottom:1px solid #ddd;
}
.column div{
  padding-top: 3px;
  padding-left: 5px;
  margin-left: 5px;
  border-bottom:1px solid #ddd;

}
</style> 
<style>
  div.mint-indexlist-nav{
    position: fixed;
  }
  .mint-indexsection-index{
    background-color: #eee !important;
    height: 36px;
    line-height: 16px;
    cursor: default;
  }
</style>