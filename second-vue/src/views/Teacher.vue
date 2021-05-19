<template>
  <div>
    <el-carousel :interval="5000" arrow="always" height="420px" style="width: 100%">
      <el-carousel-item v-for="image in images" :key="image">
        <el-image
            :src="image"
            fit="contain"></el-image>
      </el-carousel-item>
    </el-carousel>
    <div>
      <h2>教师团队</h2>
      <p>我们机构的教学团队是全XX乃至XX有权威、专业、高学历的师资队伍，他们由近二十位拥有众多光环的年轻人组成。他们之中：XXX以上 来自北大清华；XXX以上具有数学竞赛经验并曾取得优异成绩；XXX具有多年英语的教研教学经验。这些老师从小优秀，深知学习的快乐和作用，熟知学习的方法与技巧，和他们在一起的学员不仅获得专业的数学知识，还将从这些老师的品质中获得励志与品格的教育。</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "Teacher",
  data(){
    return {
      images: [
        'https://tva1.sinaimg.cn/large/007YLcQ6ly1gpsyszjgvoj31hc0u0guj.jpg',
        'https://tva1.sinaimg.cn/large/007YLcQ6ly1gpsyszjgvoj31hc0u0guj.jpg'
      ]
    }
  }
}

</script>

<style scoped>

</style>