<template>
  <div>
    <el-carousel :interval="5000" arrow="always" height="420px" style="width: 100%">
      <el-carousel-item v-for="imgUrl in imgUrls" :key="imgUrl">
        <el-image :src="imgUrl"></el-image>
      </el-carousel-item>
    </el-carousel>
    <div>
      <h2>教师团队</h2>
      <p>我们机构的教学团队是全XX乃至XX有权威、专业、高学历的师资队伍，他们由近二十位拥有众多光环的年轻人组成。他们之中：XXX以上 来自北大清华；XXX以上具有数学竞赛经验并曾取得优异成绩；XXX具有多年英语的教研教学经验。这些老师从小优秀，深知学习的快乐和作用，熟知学习的方法与技巧，和他们在一起的学员不仅获得专业的数学知识，还将从这些老师的品质中获得励志与品格的教育。</p>
    </div>
    <p style="padding: 20px;font-size: 16px;border-bottom: solid #d5d7d9 3px">
      共{{this.teachers.length}}名教师
    </p>
    <!-- 网格布局显示 -->
    <div v-if="teachers.length>0" style="display: grid;grid-template-columns: repeat(3, 1fr);">
      <template v-for="t in teachers">
        <!-- 单个item -->
        <div class="teacher" @click="clickTeacher(t.uid)">
          <h3>{{t.name}}</h3>
          <p>
            <span>职称：{{t.rank}}</span>
          </p>
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
          'https://tva1.sinaimg.cn/large/007YLcQ6ly1gpsyszjgvoj31hc0u0guj.jpg',
        'https://tva1.sinaimg.cn/large/007YLcQ6ly1gpsyszjgvoj31hc0u0guj.jpg',
      ],
      teachers: []
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
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });
    },
    clickTeacher(id) {
      let routeData = this.$router.resolve({path:'/teacherinfo', query: {id: id}})
      window.open(routeData.href, "_blank")
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
.teacher:hover {
  -webkit-box-shadow: #ccc 0 10px 10px;
  -moz-box-shadow: #ccc 0 10px 10px;
  box-shadow: #ccc 0 10px 10px;
}
.teacher:hover h3{
  color: #82b5ea;
}
</style>