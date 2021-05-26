<template>
          <div style="min-height: 480px">
            <el-table
                :data="journalisms.slice((currentPage-1)*pageSize,currentPage*pageSize)"
                highlight-current-row
                @row-click="onRowClick"
                style="width: 100%">
              <el-table-column
                  prop="title"
                  label="标题"
                  :show-overflow-tooltip="true"
                  min-width="60%">
              </el-table-column>
              <el-table-column
                  prop="author"
                  label="来源"
                  :show-overflow-tooltip="true"
                  min-width="20%">
              </el-table-column>
              <el-table-column
                  prop="pubDate"
                  label="发布时间"
                  min-width="20%">
              </el-table-column>
            </el-table>
            <el-pagination
                           layout="prev, pager, next"
                           @current-change="current_change"
                           page-size="pageSize"
                           :total="total"
                           background>
            </el-pagination>
<!--            <p>journalisms.length:{{this.journalisms.length}}</p>-->
<!--            <p>this.total:{{this.total}}</p>-->
          </div>
</template>

<script>
export default {
  name: "News",
  data() {
    return {
      journalisms:[], //后端返回的数组
      currentPage: 1, //默认当前页
      pageSize: 7, //每页数据量
      total: 130 ,//默认总数据量
    };
  },
  created(){
    this.findAllJournalisms();
  },
  methods: {
    findAllJournalisms () {
      this.$axios.get("/journalism/findAllJournalisms")
          .then((res) => {
            this.journalisms = res.data
            this.total = this.journalisms.length
          })
          .catch(error => {
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          });

    },
    current_change:function (currentPage){ //当前显示页
      this.currentPage = currentPage
    },
    onRowClick(row,event,column){
      this.row = row.index
      this.$router.push({path:"/newsDetail",
        query: {
          title:row.title,
          Titles: this.titles()
      }
      })
    },
    titles(){
      var str = '';
      for (var i =0; i<this.journalisms.length; i++){
        str += this.journalisms[i].title
        str += '/'
      }
      str = str.slice(0,str.length-1)
      return str
    }
  }
}
</script>

<style scoped>

</style>