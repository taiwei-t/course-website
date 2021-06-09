<template>
  <el-container>
    <div class="classify">
      <p align="center">分类筛选</p>
      <el-row  v-for="c in classify" style="margin: 10px 0">
        <el-button style="width: 100px" @click="clickClassify(c)">{{c}}</el-button>
      </el-row>
    </div>

    <div style="min-height: 480px;">
      <p style="padding: 20px;font-size: 16px;border-bottom: solid #d5d7d9 3px">
        搜索到{{current.length}}门课程
      </p>
      <!-- 网格布局显示课程 -->
      <div v-if="course.length>0" style="display: grid;grid-template-columns: repeat(3, 1fr);">
        <template
            v-for="c in current.slice((currentPage-1)*pageSize, (currentPage*pageSize > total)?total:currentPage*pageSize)">
          <!-- 单个课程item -->
          <div class="course" @click="clickCourse(c.course_no)" style="margin: 10px;background-color: #ffffff;border: solid 2px #dddddd">
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
            @current-change="currentChange"
            :page-size="pageSize"
            layout="prev, pager, next"
            background
            :total="total">
        </el-pagination>
      </div>
    </div>
  </el-container>

</template>

<script>
export default {
  name: "Course",
  data() {
    return{
      course: [],
      classify: [],
      courses: [],
      current: [],
      pageSize: 9, // 每页条目数
      currentPage: 1, // 当前页码，初始为1
      total: 0 // 条目总数，初始为0，请求数据之后等于数据长度
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
            // 获得所有课程分类
            this.classify.push('全部')
            for (let i in this.course) {
              if ((this.classify.length === 0) || this.inClassify(this.course[i].course_classify))
                this.classify.push(this.course[i].course_classify)
            }
            console.log(this.classify)
            for (let i in this.classify)
              this.courses[i] = []
            this.courses[0] = this.course
            for (let i in this.course) {
              for (let j in this.classify) {
                if (this.course[i].course_classify === this.classify[j])
                  this.courses[j].push(this.course[i])
              }
            }
            this.current = this.courses[0]
            this.total = this.current.length
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
    currentChange(current) {
      this.currentPage = current
    },
    inClassify(c) {
      for (let i in this.classify){
        if (c === this.classify[i])
          return false
      }
      return true
    },
    clickClassify(c) {
      let index = this.classify.findIndex(i => i === c)
      this.current = this.courses[index]
      this.total = this.current.length
    }
  }
}
</script>

<style scoped>
.classify{
  margin-top: 50px;
  height: 350px;
  margin-right: 20px;
  margin-left: 30px;
  padding: 10px;
  -webkit-box-shadow: 0 2px 10px 0 #dddddd;
  -moz-box-shadow: 0 2px 10px 0 #dddddd;
  box-shadow: 0 2px 10px 0 #dddddd;
}
.course{
  margin: 20px 0;
  padding: 20px;
  cursor: pointer;
  transition: all ease 0.5s;/* 过度效果 */
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