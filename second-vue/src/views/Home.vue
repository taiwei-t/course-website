<template>
  <div>
    <el-header style="padding: 0;height: 120px;background-color: #1357ac;position: relative">
      <Header></Header>
    </el-header>

    <el-main style="overflow: visible;padding: 20px 180px">
      <div>
        <router-view></router-view>
      </div>
    </el-main>

    <el-footer style="padding: 0;height: auto;">
      <Footer></Footer>
    </el-footer>
  </div>
</template>

<script>

import Header from "@/views/Header";
import Footer from "@/views/Footer";
export default {
  name: "Home",
  components: {Footer, Header},
}
</script>

<style scoped>

</style>