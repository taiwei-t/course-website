<template>
        <div id="newsPager">
          <el-pagination
              layout="prev, pager, next"
              page-size="10"
              :total= "10000">
          </el-pagination>
        </div>
</template>

<script>
export default {
  name: "MainNews",
  data() {
    return {
      count: 0,//起始页数值为0
      loading: false,
      totalPages: "",//取后端返回内容的总页数
      journalisms:[], //后端返回的数组
    };
  },
  created() {
    this.findAllJournalisms();
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
    }
  }
}
</script>

<style scoped>
#box{
  width: 100%;
  height: 100%;
  position: absolute;
  overflow-y: auto;
}
.box {
  width: 100%;
  margin:  0 auto;
}
.list {
  padding: 0;
  font-size: 14px;
}
.list-item {
  width: 100%;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  list-style: none;
  padding: 0 1rem;
  box-sizing: border-box;
  height: 70px;
  line-height: 70px;
  border-bottom: 1px solid #e7e7e7;
}
.loading span {
  display: inline-block;
  width: 20px;
  height: 20px;
  border: 2px solid #409eff;
  border-left: transparent;
  animation: zhuan 0.5s linear infinite;
  border-radius: 50%;
}
@keyframes zhuan {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>