<template>
  <div class="footer">
    <div class="footer-center">
      <p>重庆师范大学计算机与信息科学学院版权所有<br/>联系地址：重庆师范大学大学城校区（邮编：000000）<br/>联系电话：（023）0000000000</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "Footer"
}
</script>

<style scoped>
.footer{
  width: 100%;
  height: 80px;
  padding-top: 1px;
  background-color: #373d4b;
}
.footer-center p{
  line-height: 18px;
  color: #949699;
  font-size: 14px;
  text-align: center;
}
.footer-center{
  height: 50px;
}
</style>