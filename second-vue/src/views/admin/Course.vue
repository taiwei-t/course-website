<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="courseName" placeholder="请输入课程姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchCourseByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增课程</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="courses"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
                prop="course_no"
                label="课程编号"
                width="100">
        </el-table-column>
        <el-table-column
                prop="course_name"
                label="课程名"
                width="100">
        </el-table-column>
        <el-table-column
                prop="course_brief"
                label="课程简介"
                show-overflow-tooltip
                width="200">
        </el-table-column>
        <el-table-column
                prop="curriculum_time"
                label="开课时间"
                width="120">
        </el-table-column>
        <el-table-column
                prop="session_time"
                label="结课时间"
                width="120">
        </el-table-column>
        <el-table-column
                prop="course_classify"
                label="课程分类"
                width="120">
        </el-table-column>
        <el-table-column
                prop="teacher_id"
                label="授课教师"
                width="120">
        </el-table-column>
        <el-table-column
                prop="textbook"
                label="教材"
                width="120">
        </el-table-column>
        <el-table-column
                label="操作"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteCourses">批量删除</el-button>
    </div>

    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="course">
        <el-form-item label="课程编号" :label-width="formLabelWidth" prop="course_no">
          <el-input v-model="form.course_no" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程名" :label-width="formLabelWidth" prop="course_name">
          <el-input v-model="form.course_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程简介" :label-width="formLabelWidth" prop="course_brief">
          <el-input v-model="form.course_brief" autocomplete="off" type="textarea" placeholder="请输入课程简介" autosize="off"></el-input>
        </el-form-item>
        <el-form-item label="起止时间" :label-width="formLabelWidth" prop="course_brief">
          <el-date-picker
              v-model="form.curriculum_time"
              type="date"
              placeholder="开课时间">
          </el-date-picker>
          <el-date-picker
              v-model="form.session_time"
              type="date"
              placeholder="结课时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="课程分类" :label-width="formLabelWidth" prop="course_classify">
          <el-radio-group v-model="form.course_classify">
            <el-radio v-for="classify in classifys" :label=classify>{{classify}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="授课教师" :label-width="formLabelWidth" prop="teacher_id">
          <el-input v-model="form.teacher_id" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="教材" :label-width="formLabelWidth" prop="textbook">
          <el-input v-model="form.textbook" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCourse">确 定</el-button>
      </div>
    </el-dialog>
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
      courseName: '',
      multipleSelection:[],
      dialogTitle: {
        addCourse: "新增课程",
        editCourse: "编辑课程"
      },
      dialogStatus: "",
      rules: {
        course_no: [
          { required: true, message: '请输入编号', trigger: 'blur' }
        ],
        course_name: [
          { required: true, message: '请输入课程名', trigger: 'change' }
        ],
        course_brief: [
          { required: true, message: '请输入课程简介', trigger: 'change' }
        ],
        course_classify: [
          { required: true, message: '请选择课程分类', trigger: 'change' }
        ],
        teacher_id: [
          { required: true, message: '请输入教师', trigger: 'change' }
        ],
        textbook: [
          { required: true, message: '请输入教材', trigger: 'change' }
        ],
      },
      classifys:[
        "计算机","经济管理","心理学","音乐与舞蹈","英语","农林园艺"
      ],
      msg: '',
      courses:[],
      search: '',
      dialogFormVisible: false,
      form: {
        course_no: '',
        course_name: '',
        course_brief: '',
        curriculum_time: '',
        session_time: '',
        course_classify: '',
        teacher_id: '',
        textbook: ''
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllCourses();
  },
  watch:{
    courseName () {
        this.findAllCourses();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },
    searchCourseByName () {
        if (this.courseName !== '') {
            this.$axios.get("/course/findCourseByName?name="+this.courseName).then( (resp)=> {
                this.courses = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteCourses () {
      this.$confirm('此操作将永久删除课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/course/deleteCoursesByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllCourses();
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
    submitCourse () {
      if (this.dialogStatus === 'addCourse'){
        this.addCourse();
      } else if(this.dialogStatus === "editCourse") {
        this.editCourse();
      }
    },
    findAllCourses () {
      this.$axios.get("/course/findAllCourses")
              .then((res) => {
                this.courses = res.data
                console.log(this.courses.teacher_id)
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
      this.dialogStatus = "editCourse";
      this.form.uid= row.uid
      this.form.course_no= row.course_no
      this.form.course_name = row.course_name
      this.form.course_brief = row.course_brief
      this.form.curriculum_time = row.curriculum_time
      this.form.session_time = row.session_time
      this.form.course_classify = row.course_classify
      this.form.teacher_id = row.teacher_id
      this.form.textbook = row.textbook
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/course/deleteCourse?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllCourses();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog () {
      this.form.course_no= ''
      this.form.course_name = ''
      this.form.course_brief = ''
      this.form.curriculum_time = ''
      this.form.session_time = ''
      this.form.course_classify = ''
      this.form.teacher_id = ''
      this.form.textbook = ''
      this.dialogFormVisible = true;
      this.dialogStatus = "addCourse";
    },
    addCourse () {
      this.$refs.course.validate((valid) => {
        if (valid) {
          this.$axios.post("/course/addCourse",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllCourses();
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
    editCourse () {
      this.$axios.post("/course/updateCourse",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllCourses();
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
