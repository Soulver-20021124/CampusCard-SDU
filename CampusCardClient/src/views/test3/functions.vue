<template>
    <div>
      <!-- 搜索栏 -->
      <el-row >            
          <el-col :span="4" :offset="1" >                
          <div style="margin-top:15px"  >                    
            <el-card :body-style="{ padding: '5px'}" shadow="hover"  >                    
            <img src="http://localhost:9999/file/卡片挂失.jpg" class="image">                    
            <div>                    
                          
              <div class="bottom clearfix">                   
              <time class="time"><strong></strong></time>                    
              <el-button 
                    @click="openEditUI"
                    type="primary"
                    >挂失</el-button
                  >                  
                </div>            
            </div>                
            </el-card>                
          </div>            
          </el-col>        
          <el-col :span="4" :offset="1">                
          <div style="margin-top:15px">                    
            <el-card :body-style="{ padding: '5px'}" shadow="hover">                    
            <img src="http://localhost:9999/file/卡片解挂.jpg" class="image">                    
            <div>                    
                          
            <div class="bottom clearfix">  
              <time class="time"><strong></strong></time>                   
                                 
              <el-button 
                    @click="openEditUI3"
                    type="primary"
                  
                    
                    
                    >解挂</el-button
                  >             
            </div>                
            </div>                
            </el-card>                
          </div>            
          </el-col>
          
          <el-col :span="4" :offset="1">                
          <div style="margin-top:15px">                    
            <el-card :body-style="{ padding: '5px'}" shadow="hover">                    
            <img src="http://localhost:9999/file/补办卡片.jpg" class="image">                    
            <div>                    
                          
            <div class="bottom clearfix">                    
              <time class="time"><strong></strong></time>                    
              <el-button 
                    @click="openEditUI2"
                    type="primary"
             
                     
                    >补办</el-button
                  >                  
            </div>                
            </div>                
            </el-card>                
          </div>  
          </el-col>        


          <el-col :span="4" :offset="1">                
          <div style="margin-top:15px">                    
            <el-card :body-style="{ padding: '5px'}" shadow="hover">                    
            <img src="http://localhost:9999/file/余额充值.jpg" class="image">                    
            <div>                    
                          
            <div class="bottom clearfix">                    
              <time class="time"><strong></strong></time>                    
              <el-button 
                    @click="openEditUI4"
                    type="primary"
             
                     
                    >充值</el-button
                  >                  
            </div>                
            </div>                
            </el-card>                
          </div>            
          </el-col> 
          
          
          <el-col :span="4" :offset="1">                
          <div style="margin-top:15px">                    
            <el-card :body-style="{ padding: '5px'}" shadow="hover">                    
            <img src="http://localhost:9999/file/密码修改.jpg" class="image">                    
            <div>                    
                          
            <div class="bottom clearfix">                    
              <time class="time"><strong></strong></time>                    
              <el-button 
                    @click="openEditUI5"
                    type="primary"
             
                     
                    >修改</el-button
                  >                  
            </div>                
            </div>                
            </el-card>                
          </div>            
          </el-col>        
		  </el-row> 
           

 
      <el-dialog
        @close="clearForm"
        :title="title"
        :visible.sync="dialogFormVisible"
      >
        <el-form :model="passwordForm" ref="passwordFormRef" :rules="rules">
         
          <el-form-item
            label="密码验证"
            prop="oldPassword"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.oldPassword" autocomplete="off" show-password></el-input>
          </el-form-item>
        
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="loss">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog
        @close="clearForm2"
        :title="title2"
        :visible.sync="dialogFormVisible2"
      >
        <el-form :model="passwordForm" ref="passwordFormRef" :rules="rules">
         
          <el-form-item
            label="密码验证"
            prop="oldPassword"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.oldPassword" autocomplete="off" show-password></el-input>
          </el-form-item>
          <el-form-item
            label="扣除金额"
           
            :label-width="formLabelWidth"
          >
            <el-input v-model=cost autocomplete="off" disabled></el-input>
          </el-form-item>
        
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible2 = false">取 消</el-button>
          <el-button type="primary" @click="repair">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog
        @close="clearForm3"
        :title="title3"
        :visible.sync="dialogFormVisible3"
      >
        <el-form :model="passwordForm" ref="passwordFormRef" :rules="rules">
         
          <el-form-item
            label="密码验证"
            prop="oldPassword"
            :label-width="formLabelWidth"
          >
            <el-input v-model="passwordForm.oldPassword" autocomplete="off" show-password></el-input>
          </el-form-item>
        
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible3 = false">取 消</el-button>
          <el-button type="primary" @click="release">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog
        @close="clearForm4"
        :title="title4"
        :visible.sync="dialogFormVisible4"
      >
        <el-form :model="rechargeForm" ref="rechargeFormRef" :rules="rules2">
         
          <el-form-item
            label="充值金额"
            prop="money"
            :label-width="formLabelWidth"
          >
            <el-input v-model="rechargeForm.money" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible4 = false">取 消</el-button>
          <el-button type="primary" @click="saveRecharge">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog
        @close="clearForm5"
        :title="title5"
        :visible.sync="dialogFormVisible5"
      >
      <el-form :model="passwordForm2" ref="passwordFormRef2" :rules="rules3">
         
         <el-form-item
           label="原密码"
           prop="oldPassword"
           :label-width="formLabelWidth"
         >
           <el-input v-model="passwordForm2.oldPassword" autocomplete="off" show-password></el-input>
         </el-form-item>
         <el-form-item
           label="新密码"
           prop="newPassword"
           :label-width="formLabelWidth"
         >
           <el-input v-model="passwordForm2.newPassword" autocomplete="off" show-password></el-input>
         </el-form-item>
       
       <el-form-item
           label="重复输入新密码"
           prop="newPassword2"
           :label-width="formLabelWidth"
         >
           <el-input v-model="passwordForm2.newPassword2" autocomplete="off" show-password></el-input>
         </el-form-item>
       </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible5 = false">取 消</el-button>
          <el-button type="primary" @click="changePassword">确 定</el-button>
        </div>
      </el-dialog>
    </div>
</template>

<script>
import userApi from "@/api/userManage";
import paymentApi from "@/api/paymentManage";
import { mapGetters } from 'vuex'
export default {
    computed: {
    ...mapGetters([
      'id'
    ])
  },
    data() {
      var checkPositiveNumver = (rule, value, callback) => {
      if (value == "" || value == undefined || value == null) {
        callback();
      } else {
        var reg = /([+]\d+[.]\d+|[-]\d+[.]\d+|\d+[.]\d+|[+]\d+|[-]\d+|\d+)/gi;
        if (!(reg.test(value) && value >0)) {
          callback(new Error("请输入正数"));
        } else {
          callback();
        }
      }
    };
     
      return {
        goodList: [],
        cost:10,
        formLabelWidth: "130px",
      
        passwordForm: {
           
        },
        passwordForm2: {
           
        },
        rechargeForm: {
            rechargeIdList: []
        },
        dialogFormVisible: false,
        title: "",
        dialogFormVisible2: false,
        title2: "",
        dialogFormVisible3: false,
        title3: "",
        dialogFormVisible4: false,
        title4: "",
        dialogFormVisible5: false,
        title5: "",
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        goodList: [],
        rules: {
          oldPassword: [
          { required: true, message: "请输入旧密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 16 个字符",
            trigger: "blur",
          },
        ],       
        
        },
        rules2: {
          money: [
          
          { required: true, message: "请输入充值金额", trigger: "blur" },
          { validator: checkPositiveNumver, trigger: "blur" },
         
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
    methods: {
      loss(){
        this.$refs.passwordFormRef.validate((valid) => {
         if (valid) {
           // 提交请求给后台
           
           userApi.updateLoss(this.passwordForm.oldPassword,this.id).then(response => {
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
       this.$refs.passwordFormRef2.validate((valid) => {
         if (valid) {
           // 提交请求给后台
           
           userApi.changePassword(this.passwordForm2.oldPassword,this.passwordForm2.newPassword,this.passwordForm2.newPassword2,this.id).then(response => {
             // 成功提示
             this.$message({
               message: response.message,
               type: 'success'
             });
             // 关闭对话框
             
             this.dialogFormVisible5 = false;
             // 刷新表格
             
           });
         } else {
           console.log("error submit!!");
           return false;
         }
       });

     },
      saveRecharge() {
        
        // 触发表单验证
        this.$refs.rechargeFormRef.validate((valid) => {
          if (valid) {
            // 提交请求给后台

            paymentApi.rechargeById(this.rechargeForm.money,this.id).then(response => {
              
              // 成功提示
              this.$message({
                message: response.message,
                type: 'success'
              });
              // 关闭对话框
              
              this.dialogFormVisible4 = false;
              // 刷新表格
              
            });
          } else {
            console.log("error submit!!");
            return false;
          }
        });
        
      },
      release(){
        this.$refs.passwordFormRef.validate((valid) => {
         if (valid) {
           // 提交请求给后台
           
           userApi.updateStatus(this.passwordForm.oldPassword,this.id).then(response => {
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
      repair(){
        this.$refs.passwordFormRef.validate((valid) => {
         if (valid) {
           // 提交请求给后台
           
           userApi.updateNum(this.passwordForm.oldPassword,this.id).then(response => {
             // 成功提示
             this.$message({
               message: response.message,
               type: 'success'
             });
             // 关闭对话框
             
             this.dialogFormVisible2 = false;
             // 刷新表格
             
           });
         } else {
           console.log("error submit!!");
           return false;
         }
       });
      },
      openEditUI() {
      
      this.title = "挂失";
     
    
    this.dialogFormVisible = true;
  },
    clearForm() {
      this.passwordForm = {
        
        
      };
      this.$refs.passwordFormRef.clearValidate();
    },
    openEditUI2() {
      
      this.title2 = "补办";
     
    
    this.dialogFormVisible2 = true;
  },
    clearForm2() {
      this.passwordForm = {
        
        
      };
      this.$refs.passwordFormRef.clearValidate();
    },
    openEditUI3() {
      
      this.title3 = "解挂";
     
    
    this.dialogFormVisible3 = true;
  },
    clearForm3() {
      this.passwordForm = {
        
        
      };
      this.$refs.passwordFormRef.clearValidate();
    },
    openEditUI4() {
      
      this.title4 = "余额充值";
     
    
    this.dialogFormVisible4 = true;
  },
    clearForm4() {
      this.rechargeForm = {
        
        
      };
      this.$refs.rechargeFormRef.clearValidate();
    },
    openEditUI5() {
      
      this.title5 = "修改密码";
     
    
    this.dialogFormVisible5 = true;
  },
    clearForm5() {
      this.passwordForm2 = {
        
        
      };
      this.$refs.passwordFormRef2.clearValidate();
    },
      
     
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getGoodList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getGoodList();
      },
     
    },
    created() {
      /*this.getAllGoodList();*/
    },
  };
  </script>
  
  <style>
  #search .el-input {
    width: 200px;
    margin-right: 10px;
  }
  .el-dialog .el-input {
    width: 85%;
  }

  .time {    
font-size: 13px;    
color: #999;  

padding: 75px;
}    
.bottom {    
margin-top: 13px;    
line-height: 12px;  
}
  .button {   
     
    text-align: right; 
   }
  .image {    
  width: 100%;    
  display: block;  
  }
 
   


  </style>