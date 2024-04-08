<template>
  <div>
  <div class="navbar">
    <hamburger :is-active="sidebar.opened" class="hamburger-container" @toggleClick="toggleSideBar" />
    

    <breadcrumb class="breadcrumb-container" />
    

    <div class="right-menu">
     
      <el-dropdown class="avatar-container" trigger="click">
        
        <div class="avatar-wrapper">
          
          
          <img :src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar">
          
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
            <el-dropdown-item divided @click.native="openEditUI()">
              个人信息
            </el-dropdown-item>
          
            <el-dropdown-item divided @click.native="openEditUI3()">修改密码</el-dropdown-item>
             <el-dropdown-item divided @click.native="openInfomationUI">通知
              <el-badge is-dot class="item">
              </el-badge>
            </el-dropdown-item> 
            
            
          <el-dropdown-item divided @click.native="logout">
            <span style="display:block;">注销</span>
          </el-dropdown-item>
          
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    
    </div>
  
  <el-dialog
      @close="clearForm"
      :title="title"
      :visible.sync="dialogFormVisible"
    >
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
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveUser">确 定</el-button>
      </div>
    </el-dialog>
    
      <el-dialog
        @close="clearForm3"
        :title="title3"
        :visible.sync="dialogFormVisible3"
      >
        <el-form :model="passwordForm" ref="passwordFormRef" :rules="rules3">
         
          <el-form-item
            label="原密码"
            prop="oldPassword"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.oldPassword" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item
            label="新密码"
            prop="newPassword"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.newPassword" autocomplete="off"></el-input>
          </el-form-item>
        
        <el-form-item
            label="重复输入新密码"
            prop="newPassword2"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.newPassword2" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible3 = false">取 消</el-button>
          <el-button type="primary" @click="changePassword">确 定</el-button>
        </div>
      </el-dialog>

      <information v-if="openDialog" ref="information"> </information>

    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import userApi from "@/api/userManage";
import paymentApi from "@/api/paymentManage";
import Breadcrumb from '@/components/Breadcrumb'
import Hamburger from '@/components/Hamburger'
import information from '@/views/test2/information.vue';
import Information from '@/views/test2/information.vue';



export default {
  components: {information},
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
        
        roleIdList: []
      },
      rechargeForm: {
            rechargeIdList: []
        },
      passwordForm: {
           
      },
      dialogFormVisible: false,
      dialogFormVisible2: false,
      dialogFormVisible3: false,
      title: "",
      title2:"",
      title3:"",
      openDialog:false,
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      userList: [],
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
      
        rules3: {
          oldPassword: [
          { required: true, message: "请输入旧密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 16 个字符",
            trigger: "blur",
          },
        ],
        newPassword: [
          { required: true, message: "请输入新密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 16 个字符",
            trigger: "blur",
          },
        ],
        newPassword2: [
          { required: true, message: "请重新输入新密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 16 个字符",
            trigger: "blur",
          },
        ]
        
        },
    };
  },
  components: {
    Breadcrumb,
    Hamburger,
    Information
},
 
  methods: {
    openEditUI() {
      this.dialogFormVisible = true;
        this.title = "信息修改";
        // 根据id查询用户数据
        userApi.getUserById(this.id).then(response => {
          this.userForm = response.data;
        });
      
      this.dialogFormVisible = true;
    },
  
  openEditUI3() {
      
      this.title3 = "修改密码";
     
    
    this.dialogFormVisible3 = true;
  },
  openInfomationUI(){
    if(this.openDialog==false){
        this.openDialog=true;
      }
      else{
        this.openDialog=false;
      }
  },
    clearForm() {
      this.userForm = {
        
        roleIdList: []
      };
      this.$refs.userFormRef.clearValidate();
    },
  
    clearForm3() {
      this.passwordForm = {
        passwordIdList: []
      };
      this.$refs.passwordFormRef.clearValidate();
    },
    handleAvatarSuccess(res){

      this.userForm.avatar = res;
    },
    saveUser() {
      // 触发表单验证
      this.$refs.userFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
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
   
      changePassword() {
       
       // 触发表单验证
       this.$refs.passwordFormRef.validate((valid) => {
         if (valid) {
           // 提交请求给后台
           
           userApi.changePassword(this.passwordForm.oldPassword,this.passwordForm.newPassword,this.passwordForm.newPassword2,this.id).then(response => {
             // 成功提示
             this.$message({
               message: response.message,
               type: 'success'
             });
             // 关闭对话框
             
             this.dialogFormVisible3 = false;
             // 刷新表格
             
           });
         } else {
           console.log("error submit!!");
           return false;
         }
       });
            
            
       
     },
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      await this.$store.dispatch('user/logout')
      await this.$store.dispatch('tagsView/delAllViews')
      sessionStorage.removeItem('tabViews')
      this.$router.push(`/login`)
    }
  }
}
</script>

<style lang="scss" scoped>
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0,21,41,.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color:transparent;

    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }

  .breadcrumb-container {
    float: left;
  }
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

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}
</style>
