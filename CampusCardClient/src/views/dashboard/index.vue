<template>
  <div>
  <div class="dashboard-container">
   
    <div class="dashboard-text">
      <span v-if="id!=1">欢迎您: {{ name }}用户，您目前卡号为: {{ num }} 的校园卡的状态为
        <span v-if="this.userStatus==0" class="red">挂失</span>
        <span v-else class="green">正常</span>  
       </span>
        <span v-else>欢迎您: {{ name }}</span>
      
    </div>
    <div class="dashboard-text">
      <span v-if="id!=1">您目前的账户余额为: {{ this.userMoney }}，请注意及时充值
      </span>
    </div>
    <div class="dashboard-text">
       <span v-if="this.userPhone==0&&id!=1">请先
        <el-link class="dashboard-text"
              @click.native="openEditUI()"
             type="danger"
            
              
            >完善个人信息</el-link>
           以激活校园卡，否则您将无法进行任何消费</span>  
       <span v-else>您已完善个人信息，可以正常使用</span>  

       
      
    </div>
  </div>

  <el-dialog
        @close="clearForm"
        :title="title"
        :visible.sync="dialogFormVisible"
      >
        <el-form :model="studentForm" ref="studentFormRef" :rules="rules">

          <el-form-item
          label="学生姓名"
          prop="studentName"
          :label-width="formLabelWidth"
        >
          <el-input v-model="studentForm.studentName" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="学号"
          prop="studentNum"
          :label-width="formLabelWidth"
        >
          <el-input v-model="studentForm.studentNum" autocomplete="off" disabled></el-input>
        </el-form-item>

        <el-form-item
            label="性别"
            prop="gender"
            :label-width="formLabelWidth"
          >
              <el-select v-model="studentForm.gender" placeholder="请选择性别">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            
            </el-select>
          </el-form-item>

          
         
          <el-form-item
            label="院系"
            prop="dept"
            :label-width="formLabelWidth"
          >
          <el-select v-model="studentForm.dept" placeholder="请选择院系">
              <el-option label="软件学院" value="软件学院"></el-option>
              <el-option label="计算机学院" value="计算机学院"></el-option>
              <el-option label="材料科学与工程学院" value="材料科学与工程学院"></el-option>
              <el-option label="电气科学与工程学院" value="电气科学与工程学院"></el-option>
              <el-option label="控制科学与工程学院" value="控制科学与工程学院"></el-option>
              <el-option label="生命科学学院" value="生命科学学院"></el-option>
              <el-option label="化学学院" value="化学学院"></el-option>
              <el-option label="物理学院" value="物理学院"></el-option>
              <el-option label="哲学与社会学院" value="哲学与社会学院"></el-option>
              <el-option label="文学院" value="文学院"></el-option>
              <el-option label="新闻与传播学院" value="新闻与传播学院"></el-option>
              <el-option label="管理学院" value="管理学院"></el-option>
              <el-option label="经济学院" value="经济学院"></el-option>
              <el-option label="外国语学院" value="外国语学院"></el-option>
              <el-option label="微电子学院" value="微电子学院"></el-option>
              <el-option label="能源与动力工程学院" value="能源与动力工程学院"></el-option>
              <el-option label="马克思主义哲学学院" value="马克思主义哲学学院"></el-option>
              <el-option label="音乐学院" value="音乐学院"></el-option>
              <el-option label="数学学院" value="数学学院"></el-option>
              <el-option label="体育学院" value="体育学院"></el-option>
              <el-option label="法学院" value="法学院"></el-option>
              <el-option label="政治与公共管理学院" value="政治与公共管理学院"></el-option>
              <el-option label="历史学院" value="历史学院"></el-option>
              <el-option label="基础医学院" value="基础医学院"></el-option>
              <el-option label="公共卫生学院" value="公共卫生学院"></el-option>
            </el-select>
          </el-form-item>
          
          <el-form-item
            label="年级"
            prop="grade"
            :label-width="formLabelWidth"
          >
              <el-select v-model="studentForm.grade" placeholder="请选择年级">
              <el-option label="20" value="20"></el-option>
              <el-option label="21" value="21"></el-option>
              <el-option label="22" value="22"></el-option>
              <el-option label="23" value="23"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item
          label="电话"
          prop="phone"
          :label-width="formLabelWidth"
        >
          <el-input v-model="studentForm.phone" autocomplete="off"></el-input>
        </el-form-item>
          <el-form-item
          label="电子邮件"
          prop="email"
          :label-width="formLabelWidth"
        >
          <el-input v-model="studentForm.email" autocomplete="off"></el-input>
        </el-form-item>
        
        <el-form-item
          label="收货地址"
          prop="address"
          :label-width="formLabelWidth"
        >
          <el-input v-model="studentForm.address" autocomplete="off"></el-input>
        </el-form-item>
        
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="activition">确 定</el-button>
        </div>
      </el-dialog>
  
</div>
</template>

<script>
import { mapGetters } from 'vuex'
import userApi from "@/api/userManage";
import studentApi from "@/api/studentManage";

export default {
  name: 'Dashboard',
  computed: {
    ...mapGetters([
      'id',
      'name',
      'money',
      'status',
      'num'
    ])
  },
  data() {
    var checkEmail = (rule, value, callback) => {
      var reg =
        /^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$/;
      if (!reg.test(value)) {
        return callback(new Error("邮箱格式错误"));
      }
      callback();
      
    };
     
     return {
      formLabelWidth: "130px",
      studentForm: {
            
        },
        dialogFormVisible: false,
        title: "",
        userMoney:0,
        userPhone:2,
        userStatus:0,
        rules: {
          studentName: [
          { required: true, message: "请输入姓名", trigger: "blur" },
          {
            min: 2,
            max: 10,
            message: "长度在 2 到 10 个字符",
            trigger: "blur",
          },
        ],
          gender: [
          { required: true, message: "请选择性别", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
       dept: [
          { required: true, message: "请选择院系", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
       grade: [
          { required: true, message: "请选择年级", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
        address: [
          { required: true, message: "请输入收货地址", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
        phone: [
          { required: true, message: "请输入电话", trigger: "blur" },
          {
            min: 11,
            max: 11,
            message: "长度为11个字符",
            trigger: "blur",
          },
        ],
        email: [
          { required: false, message: "请输入电子邮件", trigger: "blur" },
          { validator: checkEmail, trigger: "blur" },
        ],
      },
     }
  },
  methods:{
    openEditUI() {
      
      this.title = "个人信息完善";
        studentApi.getStudentById(this.id).then(response => {
          this.studentForm = response.data;
        });
     
    
    this.dialogFormVisible = true;
  },
    clearForm() {
      this.studentForm = {
        
        
      };
      this.$refs.studentFormRef.clearValidate();
    },
    activition(){
    this.$refs.studentFormRef.validate((valid) => {
          if (valid) {
            // 提交请求给后台

            studentApi.updateInfo(this.studentForm).then(response => {
              
              
              
              // 成功提示
              this.$message({
                message: response.message,
                type: 'success'
              });
              // 关闭对话框
              
              this.dialogFormVisible = false;
              this.getUserPhone();
              this.getUserStatus();
              // 刷新表格
              
            });
          } else {
            console.log("error submit!!");
            return false;
          }
        });
       },
        getStudentById(){
            studentApi.getStudentById(this.id).then(response => {
                this.studentForm = response.data;
              });
          },
        getUserMoney(){
            userApi.getUserMoney(this.id).then((response) => {
           this.userMoney=response.data;
         });
        },
        getUserStatus(){
            userApi.getUserStatus(this.id).then((response) => {
           this.userStatus=response.data;
         });
        },
        getUserPhone(){
            userApi.getUserPhone(this.id).then((response) => {
           this.userPhone=response.data;
         });
        },
        },
        
  

    created() {
      this.getStudentById();
      this.getUserMoney();
      this.getUserStatus();
      this.getUserPhone();
      
     
      
    },
    
}


</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
  }
}
.red{
  color:red
}
.green{
  color:green
}
.blue{
  color:blue
}
</style>
