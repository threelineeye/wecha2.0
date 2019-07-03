<template>
    <div class="login_bg">
        <img src="../../assets/welcome.jpg" alt="#" style="object-fit:contain">
    </div>
</template>

<script>
export default {
    data(){
        return {
            count:'',
            timer:''
        }
    },
    created() {
        this.timer = setInterval(()=>{
            clearInterval(this.timer)
            this.$router.push('/');
        },1200)
    },
}
</script>

<style scoped>
    .login_bg{
        width: 100%;
        height: 100%;
        text-align: center;
        overflow: hidden;
        resize: both;
    }
    .login_bg img{
        width: 100%;
        height: 100%;
    }
</style>
