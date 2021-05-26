<template>
  <div style="min-height: 540px">
    <el-page-header
        @back="goBack"
        style="width: 100%">
    </el-page-header>
      <div>
      <template v-model="journalism">
        <ul style="padding-left: 20px;padding-right: 100px">
          <!--标题和发布日期-->
          <h1 align="center" >{{journalism.title}}</h1>
          <p align="right" >{{journalism.pubDate}}</p>
          <hr></hr>

          <!--新闻内容,以html格式插入值-->
          <p style="text-indent: 2em;
             white-space: pre-wrap">
            {{journalism.content}}
          </p>
          <hr></hr>

          <!--发表人/来源-->
          <p align="right">来源:{{journalism.author}}</p>
        </ul>
      </template>
<!--        <p align="left">titles:{{journalismTitles}}</p>-->
<!--      <p align="right">length:{{journalismTitles.length}}</p>-->
<!--      <p align="right">preIndex:{{preIndex}}</p>-->
<!--      <p align="right" style="cursor: pointer">currentIndex:{{currentIndex}}</p>-->
<!--      <p align="right" style="cursor: pointer">nextIndex:{{nextIndex}}</p>-->
      <p v-if="preIndex !== -1"
         style="cursor: pointer"
         align="left"
         @click="goPreJournalism">
        上一篇：{{journalismTitles[preIndex]}}
      </p>
      <p v-if="nextIndex !== -1"
         style="cursor: pointer"
         align="left"
         @click="goNextJournalism">
        下一篇：{{journalismTitles[nextIndex]}}
      </p>
      </div>
  </div>
</template>

<script>
export default {
  name: "NewsDetail",
  data() {
    return {
      journalism:'',
      journalismTitles:[],
      currentJournalismTitle:'',
      currentIndex: -1,
      nextIndex:-1,
      preIndex:-1
    };
  },
  created(){
      this.init()
      this.searchJournalismByName()
  },
  methods: {
    init(){
      this.currentJournalismTitle = this.$route.query.title
      this.journalismTitles = this.$route.query.Titles.split('/')
      this.currentIndex = this.journalismTitles.findIndex(item => item == this.currentJournalismTitle)
      this.preIndex = this.currentIndex-1
      if (this.currentIndex == (this.journalismTitles.length -1))
        this.nextIndex = -1
      else
        this.nextIndex = this.currentIndex + 1;
    },
    searchJournalismByName () {
      if (this.currentJournalismTitle !== '') {
        this.$axios.get("/journalism/findJournalismByTitle?title="+this.currentJournalismTitle).then( (resp)=> {
          this.journalism = resp.data;
        }).catch( (error)=>{
          this.$message({
            type: 'error',
            message: "查询失败，原因是"+error.data.message
          });
        })
      }
    },
    replaceWithBr(str) {
      return  str ? str.replace(/\n|\r/g, '<br/>') : ''
    },
    goPreJournalism() {
      //更新索引
      this.currentIndex--;

      this.nextIndex = this.currentIndex +1;
      this.preIndex = this.currentIndex -1;

      //更新内容
      this.currentJournalismTitle = this.journalismTitles[this.currentIndex]

      this.searchJournalismByName()

    },
    goNextJournalism(){
      //更新索引
      this.currentIndex++;
      this.preIndex = this.currentIndex -1;
      if (this.currentIndex == (this.journalismTitles.length -1))
        this.nextIndex = -1
      else
        this.nextIndex = this.currentIndex + 1;

      //更新内容
      this.currentJournalismTitle = this.journalismTitles[this.currentIndex]

      this.searchJournalismByName()
    },
    goBack() {
      this.$router.back()
    }
  }
}
</script>

<style scoped>
.textIndent{
  text-indent: 2em
}
</style>

