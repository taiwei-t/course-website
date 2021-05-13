<template>
  <!-- 搜索栏 -->
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="teacherName" placeholder="请输入教师姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchTeacherByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增教师</el-button>
    </div>

    <!-- 显示信息的表单 -->
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="teachers"
          max-height="430"
          border>
        <el-table-column
            fixed
            type="selection"
            width="50">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="工号"
            width="100">
        </el-table-column>
        <el-table-column
            prop="name"
            label="姓名"
            width="100">
        </el-table-column>
        <el-table-column
            prop="sex"
            label="性别"
            width="60">
        </el-table-column>
        <el-table-column
            prop="age"
            label="年龄"
            width="60">
        </el-table-column>
        <el-table-column
            prop="party"
            label="入党情况"
            width="80">
          <template slot-scope="scope">
            <template v-if="scope.row.party">已入党</template>
            <template v-else>未入党</template>
          </template>
        </el-table-column>
        <el-table-column
            prop="address"
            label="家庭住址"
            show-overflow-tooltip
            width="180">
        </el-table-column>
        <el-table-column
            prop="phone"
            label="手机号码"
            width="120">
        </el-table-column>
        <el-table-column
            prop="emil"
            label="电子邮箱"
            width="180">
        </el-table-column>
        <el-table-column
            prop="rank"
            label="职称"
            width="100">
        </el-table-column>
        <el-table-column
            prop="degree"
            label="学位"
            width="100">
        </el-table-column>
        <el-table-column
            prop="course"
            label="所授课程"
            show-overflow-tooltip
            width="150">
        </el-table-column>
        <el-table-column
            prop="research"
            label="研究方向"
            show-overflow-tooltip
            width="150">
        </el-table-column>
        <el-table-column
            prop="hobby"
            label="爱好"
            show-overflow-tooltip
            width="150">
        </el-table-column>
        <el-table-column
            prop="college"
            label="学院"
            show-overflow-tooltip
            width="150">
        </el-table-column>
        <el-table-column
            prop="hiredate"
            label="入职时间"
            width="100">
        </el-table-column>
        <el-table-column
            prop="evaluation"
            label="能力评价"
            width="150">
          <template slot-scope="scope">
            <el-rate v-model="scope.row.evaluation" disabled></el-rate>
          </template>
        </el-table-column>
        <el-table-column
            prop="brief"
            label="个人简介"
            show-overflow-tooltip
            width="150">
        </el-table-column>
        <el-table-column
            fixed="right"
            label="操作"
            width="150">
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteTeachers">批量删除</el-button>
    </div>

    <!-- 输入对话框 -->
    <el-dialog :title="dialogTitle[dialogStatus]"
               :visible.sync="dialogFormVisible"
               v-if="dialogFormVisible"
               center>
      <div style="height: 320px;overflow: auto;">
        <el-form :model="form" :rules="rules" ref="teacher">
          <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
            <el-input
                v-model="form.name"
                autocomplete="off"
                placeholder="请输入姓名"
                >
            </el-input>
          </el-form-item>
          <el-form-item label="性别" :label-width="formLabelWidth" prop="sex">
            <el-radio-group v-model="form.sex">
              <el-radio label="男">男</el-radio>
              <el-radio label="女">女</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="年龄" :label-width="formLabelWidth" prop="age">
            <el-slider
                v-model="form.age"
                show-input
                :min="18"
                :max="80">
            </el-slider>
          </el-form-item>
          <el-form-item label="入党情况" :label-width="formLabelWidth" prop="party">
            <el-switch
                v-model="form.party"
                active-text="已入党"
                inactive-text="未入党">
            </el-switch>
          </el-form-item>
          <el-form-item label="家庭住址" :label-width="formLabelWidth" prop="address">
            <el-cascader
                v-model="form.address"
                :options="options">
            </el-cascader>
          </el-form-item>
          <el-form-item label="手机号码" :label-width="formLabelWidth" prop="phone">
            <el-input v-model.number="form.phone" autocomplete="off" maxlength="11" placeholder="请输入手机号"></el-input>
          </el-form-item>
          <el-form-item label="电子邮箱" :label-width="formLabelWidth" prop="emil">
            <el-input v-model="form.emil" autocomplete="off" placeholder="请输入电子邮箱"></el-input>
          </el-form-item>
          <el-form-item label="职称" :label-width="formLabelWidth" prop="rank">
            <el-select v-model="form.rank" placeholder="请选择职称" style="width: 100%">
              <el-option
                  v-for="item in ranks"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="学位" :label-width="formLabelWidth" prop="degree">
            <el-select v-model="form.degree" placeholder="请选择学位" style="width: 100%">
              <el-option
                  v-for="item in degrees"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="所授课程" :label-width="formLabelWidth" prop="course">
            <el-checkbox-group
                v-model="form.course"
                :min="1">
              <el-checkbox v-for="course in courses" :label="course" :key="course">{{course}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <el-form-item label="学院" :label-width="formLabelWidth" prop="college">
            <el-select v-model="form.college" placeholder="请选择学院" style="width: 100%">
              <el-option
                  v-for="item in colleges"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="研究方向" :label-width="formLabelWidth" prop="research">
            <el-checkbox-group
                v-model="form.research"
                :min="1">
              <el-checkbox v-for="res in researches" :label="res" :key="res">{{res}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <el-form-item label="入职时间" :label-width="formLabelWidth" prop="hiredate">
            <el-date-picker
                v-model="form.hiredate"
                type="date"
                :picker-options="pickerOptions"
                placeholder="选择入职日期">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="爱好" :label-width="formLabelWidth" prop="hobby">
            <el-checkbox-group
                v-model="form.hobby"
                :min="1">
              <el-checkbox v-for="hobby in hobbies" :label="hobby" :key="hobby">{{hobby}}</el-checkbox>
            </el-checkbox-group>
          </el-form-item>
          <el-form-item label="能力评价" :label-width="formLabelWidth" prop="evaluation">
            <el-rate v-model="form.evaluation"></el-rate>
          </el-form-item>
          <el-form-item label="个人简介" :label-width="formLabelWidth" prop="brief">
            <el-input v-model="form.brief" autocomplete="off" type="textarea" placeholder="请输入个人简介" autosize></el-input>
          </el-form-item>
        </el-form>
      </div>

      <div slot="footer" class="dialog-footer">
        <el-button @click="closeDialog">取 消</el-button>
        <el-button type="primary" @click="submitTeacher('teacher')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { regionData,CodeToText,TextToCode } from 'element-china-area-data'

  export default {
    name: "Teacher",
    data () {
      return {
        teacherName: '',
        multipleSelection:[],
        dialogTitle: {
          addTeacher: "新增教师",
          editTeacher: "编辑教师"
        },
        dialogStatus: "",
        rules: {
          name: [
            // { required: true, message: '请输入姓名', trigger: 'blur' },
            // { min: 2, max: 20, message: '姓名长度为2到20个字符', trigger: ['blur', 'change'] },
            { pattern: /^[\u4e00-\u9fa5]+$/, message: '请输入中文', trigger: ['blur', 'change'] }
          ],
          sex: [
            { required: true, message: '请选择性别', trigger: 'blur' }
          ],
          address: [
            { required: true, message: '请输入家庭地址', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '请输入电话号码', trigger: 'blur'},
            { pattern: /^1[1356789]\d{9}$/,
              message: '请输入正确的电话号码', trigger: ['blur', 'change']}
          ],
          emil: [
            { required: true, message: '请输入电子邮箱', trigger: 'blur' },
            { pattern: /^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,3}$/,
              message: '请输入正确的电子邮箱', trigger: ['blur', 'change']}
          ],
          rank: [
            { required: true, message: '请选择职称', trigger: 'blur' }
          ],
          degree: [
            { required: true, message: '请选择学位', trigger: 'blur' }
          ],
          course: [
            { required: true, message: '请选择所授课程', trigger: 'blur' }
          ],
          hiredate: [
            { required: true, message: '请选择入职时间', trigger: 'blur' }
          ],
          evaluation: [
            { required: true, message: '请评价', trigger: 'blur' }
          ],
          research: [
            { required: true, message: '请选择研究方向', trigger: 'blur' }
          ],
          hobby: [
            { required: true, message: '请选择爱好', trigger: 'blur' }
          ],
          college: [
            { required: true, message: '请选择学院', trigger: 'blur' }
          ],
        },
        options: regionData,
        ranks: [{label: '讲师'},{label: '副教授'},{label: '教授'}],
        degrees: [{label: '学士'},{label: '硕士'},{label: '博士'}],
        colleges: [{label: '文学院'},{label: '教育科学学院'},{label: '计算机于信息科学学院'},
          {label: '马克思主义学院'},{label: '数学学院'},{label: '化学学院'},{label: '地理学院'}],
        courses:['C语言程序设计','计算机导论','数据结构',
          '操作系统','Java程序设计','面向对象程序设计',
          '数据库原理','计算机组成原理','软件工程导论',
          '设计模式','软件需求工程','软件测试'],
        researches:['人工智能','图像处理','软件开发','数据挖掘','信息安全',
          '神经网络','Web开发','物联网','电子商务','嵌入式系统开发'],
        hobbies: ['运动','阅读','音乐','游戏','舞蹈','绘画','看剧'],
        // 设置入职日期当天之后不可选
        pickerOptions: {
          disabledDate(time) {
            return time.getTime() > Date.now()
          }
        },
        msg: '',
        teachers:[],
        errors:[],
        search: '',
        dialogFormVisible: false,
        form: {
          name: '',
          age: '',
          sex: '',
          party: false,
          address: [],
          phone: '',
          emil: '',
          rank: '',
          degree: '',
          course: [],
          brief: '',
          hiredate: '',
          evaluation: '',
          research: [],
          hobby: [],
          college: ''
        },
        formLabelWidth: '120px',
      }
    },
    created() {
      this.findAllTeachers();
    },
    watch:{
      teacherName () {
        this.findAllTeachers();
      }
    },
    methods: {
      searchTeacherByName () {
        if (this.teacherName !== '') {
          this.$axios.get("/teacher/findTeacherByName?name="+this.teacherName).then( (resp)=> {
            this.teachers = resp.data;
          }).catch( (error)=>{
            this.$message({
              type: 'error',
              message: "查询失败，原因是"+error.data.message
            });
          })
        }
      },
      deleteTeachers () {
        this.$confirm('此操作将永久删除学生, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let ids = '?';
          this.multipleSelection.forEach( (item)=>{
            ids += 'ids='+item.uid+'&'
          });
          this.$axios.post("/teacher/deleteTeachersByIds"+ids).then( (resp)=> {
            if (resp) {
              this.findAllTeachers();
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
      submitTeacher (formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) { // 校验通过，新增或修改
            if (this.dialogStatus === 'addTeacher'){
              this.addTeacher();
            } else if(this.dialogStatus === "editTeacher") {
              this.editTeacher();
            }
          } else { // 校验不通过
            this.$message({
              message: '请正确输入所有字段',
              type: 'error'
            })
            return false;
          }
        });
      },
      findAllTeachers () {
        this.$axios.get("/teacher/findAllTeachers")
            .then((res) => {
              this.teachers = res.data
            })
            .catch(error => {
              this.$message({
                type: 'error',
                message: "查询失败，原因是"+error.data.message
              });
            });
      },
      handleEdit (row) {
        row = this.StrToArr(row)
        this.dialogFormVisible = true;
        this.dialogStatus = "editTeacher";
        this.form.uid = row.uid;
        this.form.name = row.name;
        this.form.age = row.age;
        this.form.sex = row.sex;
        this.form.party = row.party;
        this.form.address = row.address;
        this.form.phone = row.phone;
        this.form.emil = row.emil;
        this.form.rank = row.rank;
        this.form.degree = row.degree;
        this.form.course = row.course;
        this.form.brief = row.brief;
        this.form.hiredate = row.hiredate;
        this.form.evaluation = row.evaluation;
        this.form.research = row.research;
        this.form.hobby = row.hobby;
        this.form.college = row.college;
      },
      handleDelete (row) {
        this.$confirm('此操作将永久删除该教师, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$axios.post("/teacher/deleteTeacher?uid="+row.uid).then (()=>{
            this.$message.success("删除成功!")
            this.findAllTeachers();
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
        this.form.name = '';
        this.form.age = '';
        this.form.sex = '';
        this.form.party = false;
        this.form.address = [];
        this.form.phone = '';
        this.form.emil = '';
        this.form.rank = '';
        this.form.degree = '';
        this.form.course = [];
        this.form.brief = '';
        this.form.hiredate = '';
        this.form.evaluation = '';
        this.form.research = [];
        this.form.hobby = [];
        this.form.college = '';
        this.dialogFormVisible = true;
        this.dialogStatus = "addTeacher";
      },
      addTeacher () {
        this.$axios.post("/teacher/addTeacher",this.ArrToStr(this.form)).then( (resp)=>{
          this.dialogFormVisible = false;
          this.$message.success("添加成功!");
          this.findAllTeachers();
        }).catch((error)=>{
          this.$message({
            message: '添加数据失败，原因是'+error.data.message,
            type: 'error'
          })
          this.form=this.StrToArr(this.form)
        })
      },
      editTeacher () {
        this.$axios.post("/teacher/updateTeacher",this.ArrToStr(this.form)).then( (resp)=>{
          this.dialogFormVisible = false;
          this.$message.success("修改成功!");
          this.findAllTeachers();
        }).catch( (error)=> {
          this.$message({
            message: '数据更新失败，原因是'+error.data.message,
            type: 'error'
          })
          this.form=this.StrToArr(this.form)
        })
      },
      closeDialog() {
        this.dialogFormVisible = false
        this.findAllTeachers()
      },
      ArrToStr(data) {
        let str = CodeToText[data.address[0]] + ','
            + CodeToText[data.address[1]] + ','
            + CodeToText[data.address[2]]
        data.address = str
        str = data.course.join(',')
        data.course = str
        str = data.research.join(',')
        data.research = str
        str = data.hobby.join(',')
        data.hobby = str
        return data
      },
      StrToArr(data) {
        let arr = []
        if (data.address.length !== 0) {
          let c_arr = data.address.split(',')
          arr.push(TextToCode[c_arr[0]].code)
          arr.push(TextToCode[c_arr[0]][c_arr[1]].code)
          arr.push(TextToCode[c_arr[0]][c_arr[1]][c_arr[2]].code)
        }
        data.address = arr
        arr = []
        if (data.course.length !== 0) {
          arr = data.course.split(',')
        }
        data.course = arr
        arr = []
        if (data.research.length !== 0) {
          arr = data.research.split(',')
        }
        data.research = arr
        arr = []
        if (data.hobby.length !== 0) {
          arr = data.hobby.split(',')
        }
        data.hobby = arr
        return data
      }
    }
  }

</script>

<style scoped>

</style>