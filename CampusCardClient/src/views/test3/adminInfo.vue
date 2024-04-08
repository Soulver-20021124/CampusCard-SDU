<template>
  <div>
    <el-card>
      <el-form :model="userForm" ref="userFormRef" :rules="rules">
        <el-form-item
          label="个人头像"
          prop="avatar"
          :label-width="formLabelWidth"
        >
        <el-upload
          class="avatar-uploader"
          action="http://localhost:9999/file/uploads"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          >
          <img v-if="userForm.avatar" :src="userForm.avatar" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
        <el-form-item
          label="用户名"
          prop="username"
          :label-width="formLabelWidth"
        >
          <el-input v-model="userForm.username" autocomplete="off"></el-input>
        </el-form-item>
       
        <el-form-item
          label="用户校园卡号"
          prop="num"
          :label-width="formLabelWidth"
        >
          <el-input v-model="userForm.num" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="性别" :label-width="formLabelWidth">
         
          <el-select v-model="userForm.gender" placeholder="请选择性别">
            <el-option label="男" value="男"></el-option>
            <el-option label="女" value="女"></el-option>
          </el-select>
       
        
        </el-form-item>
       

        <el-form-item label="联系电话" :label-width="formLabelWidth">
          <el-input v-model="userForm.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户状态" :label-width="formLabelWidth">
          <el-tag v-model="userForm.status" v-if="userForm.status == 1">正常</el-tag>
            <el-tag v-else type="danger">挂失</el-tag>
         
        </el-form-item>
        <el-form-item label="卡内余额" :label-width="formLabelWidth">
          <el-input v-model="userForm.money" autocomplete="off" disabled></el-input>
        
        </el-form-item>
       
        <el-form-item
          label="电子邮件"
          prop="email"
          :label-width="formLabelWidth"
        >
          <el-input v-model="userForm.email" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div style="text-align: center;">
      <el-button
              @click="saveUser"
              type="primary"
              float="right"
            >提交</el-button>
      </div>
          
    </el-card>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import userApi from "@/api/userManage";
import studentApi from "@/api/studentManage";

export default {
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'id',
      'money'
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
      roleList: [],
      formLabelWidth: "130px",
      userForm: {
        
      },
      studentForm: {
        
      },
  
      dialogFormVisible: false,
   
      title: "",
  
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            max: 50,
            message: "长度在 3 到 50 个字符",
            trigger: "blur",
          },
        ],
       
        email: [
          { required: false, message: "请输入电子邮件", trigger: "blur" },
          { validator: checkEmail, trigger: "blur" },
        ],
      },
    
    };
  },
 
  methods: {
 
    clearForm() {
      this.userForm = {
        
      };
      this.$refs.userFormRef.clearValidate();
    },
   
    handleAvatarSuccess(res){

      this.userForm.avatar = res;
    },
    saveUser() {
      // 触发表单验证
      this.$refs.userFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
          studentApi.updateInfo(this.userForm.grade,this.id)
          userApi.saveUser(this.userForm).then(response => {
            // 成功提示
            this.$message({
              message: response.message,
              type: 'success'
            });
            // 关闭对话框
            this.dialogFormVisible = false;
            
            // 刷新表格
            
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
      
    },
  
    getUserById(){
      userApi.getUserById(this.id).then(response => {
          this.userForm = response.data;
        });
    },

    
   
  },
  created() {
      this.getUserById();
      
    },
}
</script>

<style lang="scss" scoped>
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }

  
</style>
