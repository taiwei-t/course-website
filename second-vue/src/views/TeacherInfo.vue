<template>
  <div>
    <!-- 页头 -->
    <el-page-header
        @back="goBack"
        :content="teacher.name"
        style="width: 100%">
    </el-page-header>

    <div>
      <h2 align="center" style="font-family: 楷体;font-size: 28px">{{teacher.name}}</h2>
    </div>

    <hr>
    <div>
      <h3>基本情况</h3>
      <div style="display: grid;grid-template-columns: repeat(5, 20%)">
        <p>姓名：{{teacher.name}}</p>
        <p>性别：{{teacher.sex}}</p>
        <p>年龄：{{teacher.age}}</p>
        <p>职称：{{teacher.rank}}</p>
        <p>学位：{{teacher.degree}}</p>
      </div>
    </div>

    <hr>
    <div>
      <h3>研究方向</h3>
      <div>
        <p>{{teacher.research}}</p>
      </div>
    </div>

    <hr>
    <div>
      <h3>兴趣爱好</h3>
      <div>
        <p>{{teacher.hobby}}</p>
      </div>
    </div>

    <hr>
    <div>
      <h3>个人简介</h3>
      <div style="height: 200px">
        <p>{{teacher.brief}}</p>
      </div>
    </div>

    <hr>
    <div>
      <h3>联系方式</h3>
      <div>
        <p>电话：{{teacher.phone}}</p>
        <p>邮箱：{{teacher.emil}}</p>
      </div>
    </div>
    <hr>

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
      currentIndex: -1
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
            // console.log(this.teacher)
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