<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="journalismName" placeholder="请输入新闻姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchJournalismByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增新闻</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="journalisms"
              border>
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="编号"
            width="180">
        </el-table-column>
        <el-table-column
            prop="title"
            label="标题"
            show-overflow-tooltip
            width="180">
        </el-table-column>
        <el-table-column
            prop="pubDate"
            label="发布时间"
            width="180">
        </el-table-column>
        <el-table-column
            prop="content"
            label="内容"
            show-overflow-tooltip
            width="180">
        </el-table-column>
        <el-table-column
            prop="author"
            label="作者"
            width="180">
        </el-table-column>
        <el-table-column
                label="操作">
                align="left">
          <template slot-scope="scope">
            <el-button
                    size="mini"
                    @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteJournalisms">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="journalism">
        <el-form-item label="标题" :label-width="formLabelWidth" prop="title">
          <el-input v-model="form.title" autocomplete="off"></el-input>
        </el-form-item>

        <!-- datePicker日期选择器 -->
        <el-tooltip content="请选择发布日期" placement="bottom" effect="light">
          <el-form-item label="发布时间" :label-width="formLabelWidth" prop="pubDate">
            <el-date-picker
                v-model="form.pubDate"
                type="date"
                placeholder="选择日期"
                dataformatas="yyyy年MM月dd日">
            </el-date-picker>
          </el-form-item>
        </el-tooltip>

        <!-- 文本域 -->
        <el-form-item label="新闻内容" :label-width="formLabelWidth" prop="content">
          <el-input :autosize="{ minRows: 20, maxRows: 25}" v-model="form.content" type = 'textarea' autocomplete="off" placeholder="新闻简介"></el-input>
        </el-form-item>

        <!-- 作者 -->
        <el-form-item label="作者" :label-width="formLabelWidth" prop="author">
          <el-input v-model="form.author" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitJournalism">确 定</el-button>
      </div>
    </el-dialog>
    <el-upload
            style="margin-top:20px;"
            action="/upload"
            multiple
            :on-success="handleSuccess"
            :limit="3"
            :file-list="fileList">
      <el-button size="small" type="primary">点击上传</el-button>
    </el-upload>
  </div>
</template>

<script>
// @ is an alias to /src


export default {
  name: 'Home',
  components: {
  },
  data () {
    return {
      fileList: [],
      journalismName: '',
      multipleSelection:[],
      dialogTitle: {
        addJournalism: "新增新闻",
        editJournalism: "编辑新闻"
      },
      dialogStatus: "",
      rules: {
        title: [
          { required: true, message: '请输入标题', trigger: 'blur' }
        ],
        pubDate: [
          { required: true, message: '请选择发布日期' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' }
        ],
        author:[
          { required: true, message: '请输入作者名', trigger: 'blur' }
        ]
      },
      msg: '',
      journalisms:[],
      search: '',
      dialogFormVisible: false,
      form: {
        title: '',
        pubDate: '',
        content: '',
        author: ''
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllJournalisms();
  },
  watch:{
    journalismName () {
        this.findAllJournalisms();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },
    handleSuccess (file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchJournalismByName () {
        if (this.journalismName !== '') {
            this.$axios.get("/journalism/findJournalismByTitle?name="+this.journalismName).then( (resp)=> {
                this.journalisms = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteJournalisms () {
      this.$confirm('此操作将永久删除新闻, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/journalism/deleteJournalismsByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllJournalisms();
            this.$message.success("删除成功！");
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val)
    },
    submitJournalism () {
      if (this.dialogStatus === 'addJournalism'){
        this.addJournalism();
      } else if(this.dialogStatus === "editJournalism") {
        this.editJournalism();
      }
    },
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
    handleEdit (row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editJournalism";
      this.form.uid = row.uid;
      this.form.title = row.title;
      this.form.pubDate = row.pubDate;
      this.form.content = row.content;
      this.form.author = row.author
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该新闻, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/journalism/deleteJournalism?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllJournalisms();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog () {
      this.form.uid = '';
      this.form.title = '';
      this.form.pubDate = '';
      this.form.content = '';
      this.form.author = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addJournalism";
    },
    addJournalism () {
      this.$refs.journalism.validate((valid) => {
        if (valid) {
          this.$axios.post("/journalism/addJournalism",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllJournalisms();
            }
          }).catch((error)=>{
            this.$message({
              message: '添加数据失败，原因是'+error.data.message,
              type: 'error'
            })
          })
        } else {
          this.$message({
            message: '请输入所有字段',
            type: 'error'
          })
          return false;
        }
      });
    },
    editJournalism () {
      this.$axios.post("/journalism/updateJournalism",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllJournalisms();
      }).catch( (error)=> {
        this.$message({
          message: '数据更新失败，原因是'+error.data.message,
          type: 'error'
        })
      })
    }
  }
}
</script>
<style scoped>
  .table {
    margin: 0 auto;
    clear: both;
  }
</style>
