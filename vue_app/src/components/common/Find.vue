<template>
  <div class="bkr">
    <!--发现-->
    <mt-tab-container>
      <mt-tab-container-item>
        <div class="f">
          <img src="@/assets/v2.png" alt=""> 
          <span class="reset">朋友圈</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="rightImg"></div> 
          <div class="f">
          <img src="@/assets/icon_de_saoyisao.png" alt=""> 
          <span class="reset">扫一扫</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="f">
          <img src="@/assets/icon_de_yao.png" alt=""> 
          <span class="reset">摇一摇</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="rightImg"></div> 
        <div class="f">
          <img src="@/assets/kanyikan.png" alt=""> 
          <span class="reset">看一看</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
         <div class="f">
          <img src="@/assets/souyisou.png" alt=""> 
          <span class="reset">搜一搜</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="rightImg"></div> 
        <div class="f">
          <img src="@/assets/fujinderenicon.png" alt=""> 
          <span class="reset">附近的人</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="rightImg"></div>  
        <div class="f">
          <img src="@/assets/icon_de_shop.png" alt=""> 
          <span class="reset">购物</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="f">
          <img src="@/assets/icon_de_game.png" alt=""> 
          <span class="reset">游戏</span> 
          <img src="@/assets/right.png" class="Img"  alt="">
        </div>
        <div class="rightImg"></div> 
         <div class="f">
          <img src="@/assets/ic_program.png" alt=""> 
          <span class="reset">小程序</span> 
          <img src="@/assets/right.png" class="Img" alt="">
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
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
  .bkr{
      background-color:#fff;
      position:relative;
      box-sizing: border-box;
   }
  .f{
      height: 48px;
      display:flex;
      justify-content:space-between;
      padding: 5px;
      cursor: pointer;
      border-bottom:1px solid #ddd;
  }
   .Img{     
      margin-right:8px;
      margin-top:12px;
      width:15px;
      height:15px;
     
   }
   img{
      width:35px;
      height:35px;
      border-radius: 5px;
   }
   .rightImg{      
      height:10px;  
      background-color:#ddd;
    
   }
   .reset{  
      position:absolute;
      margin-top:10px;
      margin-left:45px;
   } 
</style>
<style>
    .rightImg[data-v-15b1006a]{
      background-color: #EEEEF4 !important;
    }
</style>
