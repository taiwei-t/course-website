<template>
  <div>
    <el-carousel :interval="5000" arrow="always" height="420px" style="width: 100%">
      <el-carousel-item v-for="imgUrl in imgUrls" :key="imgUrl">
        <el-image :src="imgUrl" :fit="repeat" style="width: 100%;height: 100%"></el-image>
      </el-carousel-item>
    </el-carousel>
    <div>
      <h2>教师团队</h2>
      <p>我们机构的教学团队是国内有权威、专业、高学历的师资队伍，他们由近二十位拥有众多光环的年轻人组成。他们之中：30%以上 来自北大清华；80%以上具有数学竞赛经验并曾取得优异成绩；90%具有多年英语的教研教学经验。这些老师从小优秀，深知学习的快乐和作用，熟知学习的方法与技巧，和他们在一起的学员不仅获得专业的数学知识，还将从这些老师的品质中获得励志与品格的教育。</p>
    </div>
    <p style="padding: 20px;font-size: 16px;border-bottom: solid #d5d7d9 3px">
      共{{this.teachers.length}}名教师
    </p>
    <!-- 网格布局显示 -->
    <div v-if="teachers.length>0" style="display: grid;grid-template-columns: repeat(4, 25%);">
      <template v-for="t in teachers">
        <!-- 单个item -->
        <div class="teacher" @click="clickTeacher(t.uid)">
          <!--          <h3>{{t.name}}</h3>-->
          <!--          <p>-->
          <!--            <span>职称：{{t.rank}}</span>-->
          <!--          </p>-->
          <el-card :body-style="{ padding: '0px' }" shadow="hover">
            <el-image :src="require('../assets/image/' + t.picture_path)" class="image" :fit="cover" style="width: 250px;height: 320px"></el-image>
            <div style="padding: 14px;">
              <span style="font-size: 24px">{{t.name}}</span>
              <p>
                <span>职称：{{t.rank}}</span>
              </p>
            </div>
          </el-card>
        </div>
      </template>
    </div>
    <!-- 未找到数据时显示提示 -->
    <div v-if="teachers.length===0" align="center">暂无数据</div>

  </div>
</template>

<script>
export default {
  name: "Teacher",
  data(){
    return {
      imgUrls: [
        'http://zt.gaoxiaojob.com/cqsfdx1502.jpg',
        'https://p1.ssl.qhmsg.com/t01f4f412e182cbecd9.jpg',
        'https://jgxy.cqnu.edu.cn/bigpic/20160117172341625.jpg'

      ],
      teachers: [],
      ids: []
    }
  },
  created() {
    this.findAllTeachers()
  },
  methods: {
    findAllTeachers() {
      this.$axios.get("/public/findAllTeacher")
          .then((res) => {
            this.teachers = res.data
            console.log(this.teachers)
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
    clickTeacher(id) {
      // let routeData = this.$router.resolve({path:'/teacherinfo', query: {id: id}})
      // window.open(routeData.href, "_blank")
      this.$router.push({path:'/teacherinfo', query: {id: id, ids:this.ids.join(',')}})
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
    }
  }
}

</script>

<style scoped>
.teacher{
  margin: 20px 0;
  padding: 20px;
  cursor: pointer;
}
.teacher span{
  color: #505458;
}
.teacher:hover h3{
  color: #82b5ea;
}
</style>