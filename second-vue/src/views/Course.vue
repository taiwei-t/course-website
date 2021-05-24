<template>
  <div>
    <p style="padding: 20px;font-size: 16px;border-bottom: solid #d5d7d9 3px">
      搜索到{{this.course.length}}门课程
    </p>
    <!-- 网格布局显示课程 -->
    <div v-if="course.length>0" style="display: grid;grid-template-columns: repeat(3, 1fr);">
      <template v-for="c in course">
        <!-- 单个课程item -->
        <div class="course" @click="clickCourse(c.course_no)">
          <h3>{{c.course_name}}</h3>
          <p>
            <span>课程代码：{{c.course_no}}</span>
            <span style="border-left: solid 2px #aaa8a8;margin: 0 5px;"></span>
            <span>分类：{{c.course_classify}}</span>
          </p>
        </div>
      </template>
    </div>
    <!-- 未找到数据时显示提示 -->
    <div v-if="course.length===0" align="center">暂无数据</div>

    <!-- 分页器 -->
    <div align="center">
      <el-pagination
          :page-size="3"
          layout="prev, pager, next"
          :total="20">
      </el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  name: "Course",
  data() {
    return{
      course: []
    }
  },
  created() {
    this.findAllCourses()
  },
  methods: {
    findAllCourses() {
      this.$axios.get("/public/findAllCourse")
          .then((res) => {
            this.course = res.data
            console.log(this.course)
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    },
    clickCourse(no) {
      this.$router.push({path:'/couresedetail', query: {no: no}})
    },
  }
}
</script>

<style scoped>
.course{
  margin: 20px 0;
  padding: 20px;
  cursor: pointer;
}
.course span{
  color: #505458;
}
.course:hover {
  -webkit-box-shadow: #ccc 0 10px 10px;
  -moz-box-shadow: #ccc 0 10px 10px;
  box-shadow: #ccc 0 10px 10px;
}
.course:hover h3{
  color: #82b5ea;
}
</style>