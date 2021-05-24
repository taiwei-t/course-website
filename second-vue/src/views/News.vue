<template>
          <div>
            <el-table
                :data="journalisms.slice((currentPage-1)*pageSize,currentPage*pageSize)"
                stripe
                highlight-current-row
                :row-class-name="tableRowClassName"
                @row-click="onRowClick"
                style="width: 100%">
<!--              <el-table-column-->
<!--                  label="索引"-->
<!--                  type="index"-->
<!--                  width="50">-->
<!--              </el-table-column>-->
              <el-table-column
                  prop="title"
                  label="标题"
                  :show-overflow-tooltip="true"
                  min-width="60%">
              </el-table-column>
              <el-table-column
                  prop="author"
                  label="作者"
                  :show-overflow-tooltip="true"
                  min-width="20%">
              </el-table-column>
              <el-table-column
                  prop="pubDate"
                  label="发布时间"
                  min-width="20%">
              </el-table-column>
            </el-table>
            <el-pagination class="fy"
                           layout="prev, pager, next"
                           @current-change="current_change"
                           :total="total"
                           background>
            </el-pagination>
          <el-input v-model="this.journalisms.length"></el-input>
          <el-input v-model="this.row"></el-input>
          </div>
</template>

<script>
export default {
  name: "News",
  data() {
    return {
      journalisms:[], //后端返回的数组
      currentPage: 1, //默认当前页
      pageSize: 5, //每页数据量
      total: 100 ,//默认总数据量
      row: -1
    };
  },
  created(){
    this.findAllJournalisms();
    // this.total = this.journalisms.length
  },
  methods: {
    findAllJournalisms () {
      this.$axios.get("/journalism/findAllJournalisms")
          .then((res) => {
            this.journalisms = res.data
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
    tableRowClassName({row,rowIndex}){
      row.index = rowIndex
    },
    onRowClick(row,event,column){
      this.row = row.index
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

          title:row.title,
          Titles: this.titles()
      }
          // news:this.journalisms}
      })
    },
    titles(){
      var str = '';
      for (var i =0; i<this.journalisms.length; i++){
        str += this.journalisms[i].title
        str += '/'
      }
      return str
    }
  }
}
</script>

<style scoped>

</style>