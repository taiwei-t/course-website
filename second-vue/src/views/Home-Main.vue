<template>
  <div>
    <!-- 走马灯 -->
    <el-carousel :interval="5000"
                 arrow="always"
                 height="240px"
                 style="width: 100%;cursor:pointer;">
      <el-carousel-item v-for="image in imgUrls" :key="image.path" @click="clickImg()">
        <el-image :src="image.image" @click="clickImg"></el-image>
      </el-carousel-item>
    </el-carousel>

    <el-container>
      <!-- 推荐课程 -->
      <el-container style="flex-direction:column;margin: 15px 15px 15px 0;background-color: rgba(250,250,250,.8);border-radius: 10px">
        <div>
          <h2 style="padding-left: 20px;">推荐课程
            <span style="font-size: 18px;color: #999999;font-weight: lighter">&nbsp;&nbsp;Courses</span>
          </h2>
          <div style="height:1px;background-color: #b9b9b9;margin: -10px 10px 10px 18px"></div>
        </div>

        <template v-for="c in courses">
          <ul style="padding-left: 20px;padding-right: 10px;margin-block-start: 8px;margin-block-end: 8px;">
            <li @click="clickCourse(c.courseNo)" style="cursor:pointer;list-style-type:none;">
              <i class="lnr lnr-book" style="padding-right: 10px"></i><a>{{c.courseName}}
              <span style="float: right">[{{c.courseClassify}}]</span>
            </a></li>
          </ul>
        </template>
        <!-- 未找到数据时显示提示 -->
        <div v-if="courses.length===0" align="center">暂无数据</div>
      </el-container>

      <!-- 优秀教师 -->
      <el-container style="flex-direction:column;margin: 15px 0 15px 15px;background-color: rgba(250,250,250,.8);border-radius: 10px">
        <div>
          <h2 style="padding-left: 20px;">优秀教师
            <span style="font-size: 18px;color: #999999;font-weight: lighter">&nbsp;&nbsp;Teachers</span>
          </h2>
          <div style="height:1px;background-color: #b9b9b9;margin: -10px 10px 10px 18px"></div>
        </div>
        <template v-for="t in teachers">
          <ul style="padding-left: 20px;padding-right: 10px;margin-block-start: 8px;margin-block-end: 8px;">
            <li @click="clickTeacher(t.uid)" style="cursor:pointer;list-style-type:none;">
              <i class="lnr lnr-graduation-hat" style="padding-right: 10px;font-size:20px"></i><a>{{t.name}}</a>
              <span style="float: right">[{{t.rank}}]</span>
            </li>
          </ul>
        </template>
        <!-- 未找到数据时显示提示 -->
        <div v-if="teachers.length===0" align="center">暂无数据</div>
      </el-container>
    </el-container>

    <el-container>
      <!-- 热门新闻 -->
      <el-container style="flex-direction:column;margin: 15px 0 15px 0;background-color: rgba(250,250,250,.8);border-radius: 10px">
        <div>
          <h2 style="padding-left: 20px;">热门新闻
            <span style="font-size: 18px;color: #999999;font-weight: lighter">&nbsp;&nbsp;News</span>
          </h2>
          <div style="height:2px;background-color: #b9b9b9;margin: -10px 10px 10px 18px"></div>
        </div>
        <template v-for="n in news">
          <ul style="padding-left: 20px;padding-right: 10px;margin-block-start: 8px;margin-block-end: 8px;">
            <li @click="onRowClick(n.title)" style="cursor:pointer;list-style-type:none;">
              <i class="el-icon-paperclip" style="padding-right: 10px"></i>
              <a>{{n.title}}
              <span style="float: right">[{{n.pubDate}}]</span>
              </a>
            </li>
          </ul>
        </template>
        <!-- 未找到数据时显示提示 -->
        <div v-if="news.length===0" align="center">暂无数据</div>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Home-Main",
  data(){
    return {
      imgUrls: [
        {image:require('../assets/image/1fc134dc69af493085fd831127b3755e.jpg'),path:"1"},
        {image:require('../assets/image/140bb149766b4c5d8e5b9b6c01bab613.jpg'),path:"/course"},
        {image:require('../assets/image/4d875bfcd0944433b13250535b04404c.jpg'),path:"/course"}
      ],
      courses: [],
      teachers: [],
      news: [],
      ids: []
    }
  },
  created() {
    this.findRecommendCourses()
    this.findExcellentTeacher()
    this.findAllNews()
  },
  methods: {
    clickImg(id){
      this.$message.info("待开发")
    },
    clickCourse(no) {
      this.$router.push({path:'/couresedetail', query: {no: no}})
    },
    clickTeacher(id) {
      // let routeData = this.$router.resolve({path:'/teacherinfo', query: {id: id}})
      // window.open(routeData.href, "_blank")
      this.$router.push({path:'/teacherinfo', query: {id: id, ids:this.ids.join(',')}})
    },
    onRowClick(title){
      this.$router.push({path:"/newsDetail",
        query: {
          // title:this.journalisms[row].title,
          // author:this.journalisms[row].author,
          // pubDate:this.journalisms[row].pubDate,
          // content:this.journalisms[row].content}
          //   title:row.title,
          //   author:row.author,
          //   pubDate:row.pubDate,
          //   content:row.content}

          title:title,
          Titles: this.titles()
        }
        // news:this.journalisms}
      })
    },
    findRecommendCourses() {
      this.$axios.get("/public/findRecommendCourses")
          .then((res) => {
            this.courses = res.data
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    },
    findExcellentTeacher() {
      this.$axios.get("/public/findExcellentTeacher")
          .then((res) => {
            this.teachers = res.data
            for (let i in this.teachers){
              this.ids.push(this.teachers[i].uid)
            }
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    },
    findAllNews() {
      this.$axios.get("/journalism/findAllJournalisms")
          .then((res) => {
            this.news = res.data
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    },
    titles(){
      var str = '';
      for (var i =0; i<this.news.length; i++){
        str += this.news[i].title
        str += '/'
      }
      return str
    }
  }
}
</script>

<style scoped>
h2{
  color: #4089e5;
}
</style>