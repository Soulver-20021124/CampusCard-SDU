<template>
    <div>
      <!-- 搜索栏 -->
      <el-card id="search">
        <el-row>
          <el-col :span="20">
            <el-input
              v-model="searchModel.paymentName"
              placeholder="商品名"
              clearable
            ></el-input>
         
            <el-button
              @click="getPaymentList"
              type="primary"
              round
              icon="el-icon-search"
              >查询</el-button
            >
            <el-button
              @click="openUI"
              type="primary"
              round
              icon="el-icon-search"
              >查看已缴费事项</el-button
            >
          </el-col>
         
          <el-col :span="4" align="right">余额:{{ this.userMoney }}
            <el-button type="primary" icon="el-icon-money" @click="openEditUI(null)" >充值</el-button>
          </el-col>
        </el-row>
       
      </el-card>
  
      <!-- 结果列表 -->
      <el-card>
        <el-table :data="paymentList" stripe style="width: 100%">
          <el-table-column label="#" width="80">
            <template slot-scope="scope">
              <!-- (pageNo-1) * pageSize + index + 1 -->
              {{
                (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1
              }}
            </template>
          </el-table-column>
          
         
          <el-table-column prop="paymentName" label="缴费事项名" >
          </el-table-column>
          <el-table-column prop="price" label="价格（/元）">
          </el-table-column>
          <el-table-column prop="time" label="发布时间" >
          </el-table-column>
          <el-table-column label="操作" > 
            <template slot-scope="scope">
                <el-button @click="buyPayment(scope.row)" type="success" icon="el-icon-wallet" size="mini" circle></el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-card>
  
      <!-- 分页组件 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="searchModel.pageNo"
        :page-sizes="[5, 10, 20, 50]"
        :page-size="searchModel.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
  
      <!-- 用户信息编辑对话框 -->
  


      <el-dialog
        @close="clearForm"
        :title="title"
        :visible.sync="dialogFormVisible"
      >
        <el-form :model="rechargeForm" ref="rechargeFormRef" :rules="rules">
         
          <el-form-item
            label="充值金额"
            prop="money"
            :label-width="formLabelWidth"
          >
            <el-input v-model="rechargeForm.money" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveRecharge">确 定</el-button>
        </div>
      </el-dialog>

      <isPay title="ok" v-if="openDialog" ref="isPay" ></isPay>
    </div>
  </template>
  
  <script>
  import paymentApi from "@/api/paymentManage";
  import userApi from "@/api/userManage";

  import { mapGetters } from 'vuex'
  import isPay from "./isPay.vue";

  export default {
    components: {isPay},
    computed: {
    ...mapGetters([
      'id',
      'money'
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
        paymentList: [],
        isPayList:[],
     
        formLabelWidth: "130px",
        rechargeForm: {
            rechargeIdList: []
        },
        dialogFormVisible: false,
        userMoney:0,
        openDialog:false,
        title: "",
     
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        paymentList: [],
        isPayList:[],
        rules: {
          money: [
          
          { required: true, message: "请输入充值金额", trigger: "blur" },
          { validator: checkPositiveNumver, trigger: "blur" },
         
        ],
        
        },
      };
    },
    methods: {
      /*getAllGoodList(){
        goodApi.getAllGoodList().then(response => {
          this.goodList = response.data;
          console.log(this.goodList);
        });
      },*/
      buyPayment(payment){
      this.$confirm(`您确认缴费 ${payment.paymentName} ?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            paymentApi.buyPaymentById(payment.paymentId,this.id).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
           
            this.getPaymentList();
            this.getUserMoney();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消购买'
          });          
        });
    },
    openUI(){
      if(this.openDialog==false){
        this.openDialog=true;
      }
      else{
        this.openDialog=false;
      }
      
    },
      saveRecharge() {
        
        // 触发表单验证
        this.$refs.rechargeFormRef.validate((valid) => {
          if (valid) {
            // 提交请求给后台
            

            paymentApi.rechargeById(this.rechargeForm.money,this.id).then(response => {
              
              this.$store.commit('user/UPDATE',this.rechargeForm.money)
              window.sessionStorage.setItem('money',this.$store.state.user.money)
              
              // 成功提示
              this.$message({
                message: response.message,
                type: 'success'
              });
              // 关闭对话框
              
              this.dialogFormVisible = false;
              this.getUserMoney();
              
              
              // 刷新表格
              
            });
          } else {
            console.log("error submit!!");
            return false;
          }
        });
        
      },
      openEditUI() {
      
        this.title = "余额充值";
       
      
      this.dialogFormVisible = true;
    },
     
      clearForm() {
        this.rechargeForm = {
          rechargeIdList: []
        };
        this.$refs.rechargeFormRef.clearValidate();
      },
     
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getPaymentList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getPaymentList();
      },
      getPaymentList() {
        paymentApi.getPaymentList(this.searchModel).then((response) => {
          this.paymentList = response.data.rows;
          this.total = response.data.total;
        });
      },
      getUserMoney(){
        userApi.getUserMoney(this.id).then((response) => {
        this.userMoney=response.data;
        });
      }
      
      
     
    },
    created() {
      this.getPaymentList();
      this.getUserMoney();

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
  </style>