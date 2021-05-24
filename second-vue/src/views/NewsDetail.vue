<template>
  <div>
      <template v-model="journalism">
        <ul style="padding-left: 20px;padding-right: 100px">
          <!--标题和发布日期-->
          <h1>{{journalism.title}}</h1>
          <p align="right">{{journalism.pubDate}}</p>
          <hr></hr>

          <!--新闻内容-->
          <span v-html="replaceWithBr(journalism.content)"></span>
          <hr></hr>

          <!--发表人-->
          <p align="right">{{journalism.author}}</p>
        </ul>
      </template>
<!--    <p align="right">{{journalismTitles}}</p>-->
    <p align="right">{{preIndex}}</p>
    <p align="right">{{currentIndex}}</p>
    <p align="right">{{nextIndex}}</p>
    <p v-if="preIndex !== -1" align="left" @click="goPreJournalism">上一篇：{{journalismTitles[preIndex]}}</p>
    <p v-if="nextIndex !== -1" align="left" @click="goNextJournalism">下一篇：{{journalismTitles[nextIndex]}}</p>
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
      this.replaceWithBr()
  },
  methods: {
    init(){
      this.currentJournalismTitle = this.$route.query.title
      this.journalismTitles = this.$route.query.Titles.split('/')
      this.currentIndex = this.journalismTitles.findIndex(item => item === this.currentJournalismTitle)
      this.preIndex = this.currentIndex-1
      this.nextIndex = this.currentIndex + 1
      if(this.nextIndex >= this.journalismTitles.length){
        this.nextIndex = -1
      }
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
    //判断前一篇和后一片新闻的index是否越界
    //未越界 : 返回True，越界反之
    isNextIndexOutOfIndex(){
      return this.nextIndex !== -1
    },
    isPreIndexOutOfIndex(){
      return this.preIndex !== -1
    },
    goPreJournalism() {
      //更新索引
      this.currentIndex--;
      if (this.isNextIndexOutOfIndex())
        this.nextIndex --;
      if(this.isPreIndexOutOfIndex())
        this.preIndex --;

      //更新内容
      this.currentJournalismTitle = this.journalismTitles[this.currentIndex]

      this.searchJournalismByName()

    },
    goNextJournalism(){
      //更新索引
      this.currentIndex++;
      if (this.isNextIndexOutOfIndex())
        this.nextIndex ++;
      if(this.isPreIndexOutOfIndex())
        this.preIndex ++;

      //更新内容
      this.currentJournalismTitle = this.journalismTitles[this.currentIndex]

      this.searchJournalismByName()
    }
  }
}
</script>

<style scoped>

</style>

