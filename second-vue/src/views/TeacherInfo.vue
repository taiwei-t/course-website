<template>
  <div :style="bgImg" style="padding: 10px 10px;margin: -20px 0">
    <!-- 页头 -->
    <el-page-header
        @back="goBack"
        :content="teacher.name"
        style="width: 100%">
    </el-page-header>

    <div style="margin-top: 50px;margin-left: 100px">
      <el-row :gutter="30">
        <el-col span="8">
          <el-image :src="require('../assets/image/' + teacher.picture_path)" style="border-radius: 5px;width: 280px;height: 360px;margin-left: 25px"></el-image>
          <h2 align="center" style="font-family: 楷体;font-size: 28px;">{{teacher.name}}</h2>
        </el-col>

        <el-col span="14">
          <div class="grid-content bg-purple-light">
            <div class="title-bg"><h3 class="title">基本情况</h3></div>
            <div style="display: grid;grid-template-columns: repeat(4, 25%)">
              <p>性别：{{teacher.sex}}</p>
              <p>年龄：{{teacher.age}}</p>
              <p>职称：{{teacher.rank}}</p>
              <p>学位：{{teacher.degree}}</p>
            </div>
          </div>
          <div style="margin-top: 50px">
            <div class="title-bg"><h3 class="title">研究方向</h3></div>
            <div>
              <p>{{teacher.research}}</p>
            </div>
          </div>

          <div style="margin-top: 50px">
            <div class="title-bg"><h3 class="title">兴趣爱好</h3></div>
            <div>
              <p>{{teacher.hobby}}</p>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div style="margin: 0 80px">
      <div class="title-bg"><h3 class="title">个人简介</h3></div>
      <div style="height: 200px">
        <p>{{teacher.brief}}</p>
      </div>
    </div>

    <div style="margin: 0 80px">
      <div class="title-bg"><h3 class="title">联系方式</h3></div>
      <div>
        <p>电话：{{teacher.phone}}</p>
        <p>邮箱：{{teacher.emil}}</p>
      </div>
    </div>

    <div>
      <p>
        <span v-if="currentIndex === 0">没有了</span>
        <span class="pre" v-if="currentIndex !== 0" @click="preTeacher">上一篇</span>
        <span class="next" v-if="currentIndex !== this.ids.length-1" @click="nextTeacher">下一篇</span>
        <span v-if="currentIndex === this.ids.length-1" style="float: right">没有了</span>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: "TeacherInfo",
  data(){
    return{
      teacher: [],
      ids: [],
      currentId: '',
      currentIndex: -1,
      bgImg: {
        backgroundImage: "url(" + require("../assets/image/bg.png") + ")",
        backgroundRepeat: "repeat",
        backgroundColor: "#cccccc"
      },
    }
  },
  created() {
    this.currentId = this.$route.query.id
    this.ids = this.$route.query.ids.split(',')
    this.currentIndex = this.ids.findIndex(item => item === this.currentId)
    this.findTeacher(this.currentId)
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
    },
    preTeacher() {
      this.currentIndex--
      this.currentId = this.ids[this.currentIndex]
      this.findTeacher(this.currentId)
      this.backTop()
    },
    nextTeacher() {
      this.currentIndex++
      this.currentId = this.ids[this.currentIndex]
      this.findTeacher(this.currentId)
      this.backTop()
    },
    backTop(){ //回到顶部
      let timer = setInterval(function(){
        let osTop = document.documentElement.scrollTop || document.body.scrollTop;
        let ispeed = Math.floor(-osTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop = osTop + ispeed;
        this.isTop = true;
        if(osTop === 0){
          clearInterval(timer);
        }
      },30)
    },
    goBack() {
      this.$router.back()
    }
  }
}
</script>

<style scoped>
.title-bg{
  background-color: #eeeeee;
  border-radius: 5px;
  height: 30px;
}
.title{
  color: #ffffff;
  background-color: #373d4b;
  padding-left: 20px;
  width: 100px;
  height:30px;
  border-radius: 5px;
}
.pre{
  cursor:pointer;
}
.next{
  cursor:pointer;
  float: right;
}
.pre:hover{
  color: #4089e5;
}
.next:hover{
  color: #4089e5;
}
</style>