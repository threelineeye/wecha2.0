<template>
    <div>
        <img :src="focused?selectedImage:normalImage" alt="#" class="imgStyle">
    </div>
</template>

<script>
export default {
    props:{
        focused:{type:Boolean},
        selectedImage:{default:""},
        normalImage:{default:""}
    }
}
</script>

<style scoped>
    .imgStyle{
        width:30px;
        height:30px;
    }
</style>