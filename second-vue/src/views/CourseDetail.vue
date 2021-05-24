<template>
  <div>
    <!-- 页头 -->
    <el-page-header
        @back="goBack"
        :content="course.course_name"
        style="width: 100%">
    </el-page-header>

    <!-- 标题 -->
    <div class="course_title">
      <div style="padding: 0 30px;color: #ffffff;background: rgba(0,0,0,.3);height: 100%">
        <h2 style="padding-left: 30px;padding-top: 40px;font-size: 32px">{{this.course.course_name}}</h2>
        <p>
          <i class="el-icon-time"></i>
          开课时间：{{this.course.curriculum_time}}到{{this.course.session_time}}
        </p>
        <p>
          <i class="el-icon-collection-tag"></i>
          课程分类：{{this.course.course_classify}}
        </p>
        <el-button style="float: right;margin-right: 50px;font-size: 18px">开始学习</el-button>
      </div>
    </div>

    <!-- 课程简介 -->
    <div class="course_brief">
      <el-container style="justify-content: space-between;padding-right: 60px">
        <div style="width: 500px">
          <h3 style="font-size: 28px">课程简介</h3>
          <p>{{this.course.course_brief}}</p>
        </div>
        <el-image src="https://qn-next.xuetangx.com/15668785211591.jpg"></el-image>
      </el-container>
    </div>

    <!-- 教材 -->
    <div style="margin-top: 30px;border-bottom: solid 2px #cccccc;border-top: solid 2px #cccccc">
      <div align="center" style="font-size: 28px;margin-top: 20px">推荐教材</div>
      <div style="margin-bottom: 30px">
        <p align="center" style="font-size: 18px">{{this.course.textbook}}</p>
      </div>
    </div>

    <!-- 课程章节 -->
    <div style="margin-top: 30px;">
      <div align="center" style="font-size: 28px;margin-top: 20px">课程章节</div>
      <div v-for="o in 5" style="margin-bottom: 30px">
        <p align="center" style="font-size: 18px">{{o}}、章节</p>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "CourseDetail",
  data(){
    return{
      course: []
    }
  },
  created() {
    this.findCourse(this.$route.query.no)
  },
  methods: {
    findCourse(no) {
      this.$axios.get("/public/findCourseByNo?no="+no)
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
    goBack() {
      this.$router.back()
    }
  }
}
</script>

<style scoped>
.course_title{
  background: url(../assets/image/course_new.png) 50%;
  width: 100%;
  height: 300px;
  margin: 20px 0;
}
.course_title p{
  padding-left: 30px;
  line-height: 32px;
  font-size: 16px;
}
.course_brief{
  width: 100%;
  margin: 20px 30px;
}
</style>