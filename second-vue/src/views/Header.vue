<template>
  <div class="header" >
    <p class="title" @click="clickTitle">
      <span class="course">高校</span>
      <span class="website">课程网站</span>
    </p>
    <el-menu mode="horizontal" @select="selectMenu">
      <el-menu-item index="/home">首页</el-menu-item>
      <el-menu-item index="/teacher">教师团队</el-menu-item>
      <el-menu-item index="/course">精品课程</el-menu-item>
      <el-menu-item index="/news">新闻动态</el-menu-item>
      <el-menu-item index="/about">关于我们</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "Header",
  methods: {
    selectMenu(index){
      this.$router.replace(index);
    },
    clickTitle() {
      this.$router.replace("/home");
    }
  }
}
</script>

<style scoped>
.title{
  margin: 20px auto;
  float: left;
  font-size: 36px;
  font-weight: 400;
  color: black;
  cursor: pointer;
}
.course{
  color: cornflowerblue;
  font-family: 楷体;
  font-weight: bolder;
}
.website{
  color: dimgray;
  font-family: 新宋体;
}
.el-menu {
  float: right;
  margin: 20px auto;
}
.el-menu-item{
  font-size: 20px;
  color: black;
}
.header{
  width: 1000px;
  margin: 0 auto;
  background-color: #505458;
}
</style>