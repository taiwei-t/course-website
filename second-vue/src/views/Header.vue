<template>
  <div class="header" >
      <div class="title" @click="clickTitle">
        <img src="../assets/image/logo.png">
        <p class="website">在线精品课程</p>
      </div>
    <el-menu mode="horizontal"
             router
             background-color="#1357ac"
             text-color="#fff"
             active-text-color="#ffd04b">
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
    clickTitle() {
      this.$router.replace("/home");
    }
  }
}
</script>

<style scoped>
.title{
  float: left;
  margin: 10px auto;
  font-weight: 400;
  color: black;
  cursor: pointer;
}
.website{
  float: right;
  margin-top: 40px;
  margin-left: 10px;
  color: #ffffff;
  font-size: 32px;
  font-family: 华文楷体;

}
.el-menu {
  float: right;
  margin-top: 60px;
}
.el-menu-item{
  font-size: 20px;
  color: black;
}
.header{
  height: 120px;
  margin: 0 200px;
}
</style>