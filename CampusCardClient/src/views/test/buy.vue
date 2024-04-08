<template>
  <div>
    <!-- 搜索栏 -->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input
            v-model="searchModel.goodName"
            placeholder="商品名"
            clearable
          ></el-input>
          <el-button
            @click="getGoodList"
            type="primary"
            round
            icon="el-icon-search"
            >查询</el-button
          >
        </el-col>

        <el-col :span="4" align="right">余额:{{ this.userMoney }}
            <el-button type="primary" icon="el-icon-money" @click="openEditUI(null)" >充值</el-button>
          </el-col>
        
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-row>
      <el-col
        v-for="item in goodList"
        :key="item.goodId"
        :span="5"
        style="margin-bottom: 10px"
        :offset="1"
      >
        <el-card>
          <div slot="header" class="clearfix">
           <span style="margin-left: 5px">{{
              item.goodName}}</span>
           
          </div>
          
          <div>
            <img :src="item.avatar+'?imageView2/1/w/80/h/80'" class="image">
            
          </div>
          <div style="padding: 14px;">
            <span>
            商家：{{item.business}}</span>
            
          </div>
          <div style="padding: 14px;">
            <span >
            价格（/元）：{{item.price}}</span>
            
          </div>
          <div style="padding: 14px;">
            <span >
            上架时间：{{item.time}}</span>
            
          </div>
          <div
            style="display: inline-block; float: right; cursor: pointer"
            @click="buyGood(item)"
            
          >
            <el-tooltip effect="dark" content="购买" placement="bottom">
              <i class="el-icon-shopping-cart-1" />
            </el-tooltip>
          </div>
         
        </el-card>
      </el-col>
    </el-row>

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
    
  </div>
</template>

<script>
import goodApi from "@/api/goodManage";
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
      formLabelWidth: "130px",
      goodForm: {
        goodIdList: []
      },
      rechargeForm: {
            rechargeIdList: []
        },
     
      dialogFormVisible: false,
      title: "",
      userMoney:0,
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      goodList: [],
      rules: {
        money: [
          
          { required: true, message: "请输入充值金额", trigger: "blur" },
          { validator: checkPositiveNumver, trigger: "blur" },
         
        ],
        
        },
      
    };
  },
  methods: {
   
    buyGood(good){
      this.$confirm(`您确认购买商品 ${good.goodName} ?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          goodApi.buyGoodById(good.goodId,this.id).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
           
            this.getGoodList();
            this.getUserMoney();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消购买'
          });          
        });
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
      this.getGoodList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getGoodList();
    },
    
    getGoodList() {
      goodApi.getGoodList(this.searchModel).then((response) => {
        this.goodList = response.data.rows;
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
    this.getGoodList();
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