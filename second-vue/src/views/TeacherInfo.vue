<template>
  <div>
    <template v-model="teacher">
      <p>姓名：{{teacher.name}}</p>
      <p>性别：{{teacher.sex}}</p>
      <p>年龄：{{teacher.age}}</p>
      <p>电话：{{teacher.phone}}</p>
      <p>邮箱：{{teacher.emil}}</p>
      <p>职称：{{teacher.rank}}</p>
    </template>
  </div>
</template>

<script>
export default {
  name: "TeacherInfo",
  data(){
    return{
      teacher: []
    }
  },
  created() {
    this.findTeacher(this.$route.query.id)
  },
  methods: {
    findTeacher(id) {
      this.$axios.get("/public/findTeacherById?uid="+id)
          .then((res) => {
            this.teacher = res.data
            console.log(this.teacher)
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    }
  }
}
</script>

<style scoped>

</style>