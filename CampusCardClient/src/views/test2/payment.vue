<template>
    <div>
      <!-- 搜索栏 -->
      <el-card id="search">
        <el-row>
          <el-col :span="20">
            <el-input
              v-model="searchModel.paymentName"
              placeholder="缴费事项名"
              clearable
            ></el-input>
            <el-button
              @click="getPaymentList"
              type="primary"
              round
              icon="el-icon-search"
              >查询</el-button
            >

            
          </el-col>
          <el-col :span="4" align="right">
            <el-button
              @click="openEditUI(null)"
              type="primary"
              icon="el-icon-plus"
             
            >发布缴费事项</el-button>
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
          <el-table-column prop="price" label="费用（/元）" >
          </el-table-column>
          <el-table-column prop="time" label="发布时间" >
          </el-table-column>
          <el-table-column label="操作"> 
            <template slot-scope="scope">
              <el-button @click="openEditUI(scope.row.paymentId)" type="primary" icon="el-icon-edit" size="mini" circle></el-button>
              <el-button @click="deletePayment(scope.row)" type="danger" icon="el-icon-delete" size="mini" circle></el-button>
              <el-button @click="query(scope.row.paymentId)" type="success" icon="el-icon-document" size="mini" circle></el-button>
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
        <el-form :model="paymentForm" ref="paymentFormRef" :rules="rules">
          <el-form-item
            label="缴费事项名"
            prop="paymentName"
            :label-width="formLabelWidth"
          >
            <el-input v-model="paymentForm.paymentName" autocomplete="off"></el-input>
          </el-form-item>
          
         
          <el-form-item
            label="费用（/元）"
            prop="price"
            :label-width="formLabelWidth"
          >
            <el-input v-model="paymentForm.price" autocomplete="off"></el-input>
          </el-form-item>

          <el-form-item
            label="发布时间"
            prop="time"
            :label-width="formLabelWidth"
          >
          <el-input v-if="paymentForm.time==null?paymentForm.time=this.date:paymentForm.time=paymentForm.time" v-model="paymentForm.time" autocomplete="off" disabled></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="savePayment">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog
        :title="title2"
        :visible.sync="dialogFormVisible2">
        <el-table :data="isPayStudentList" stripe style="width: 100%">
          <el-table-column label="#" width="80">
            <template slot-scope="scope">
              <!-- (pageNo-1) * pageSize + index + 1 -->
              {{
                (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1
              }}
            </template>
          </el-table-column>
          
         
          <el-table-column prop="paymentName" label="缴费事项名" width="180">
          </el-table-column>
          <el-table-column prop="price" label="费用（/元）" >
          </el-table-column>
          <el-table-column prop="userId" label="缴费用户id" >
          </el-table-column>
          <el-table-column prop="userName" label="缴费学生姓名" >
          </el-table-column>
          <el-table-column prop="time" label="缴费时间" >
          </el-table-column>
         
        </el-table>
      </el-dialog>


      
    </div>
  </template>
  
  <script>
  import paymentApi from "@/api/paymentManage";
  import roleApi from "@/api/roleManage";
  export default {
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
        date:" ",
        paymentList: [],
        isPayStudentList:[],
        openDialog:false,
        formLabelWidth: "130px",
        paymentForm: {
            paymentIdList: []
        },
        dialogFormVisible: false,
        title: "",
        dialogFormVisible2: false,
        title2: "",
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        paymentList: [],
        rules: {
          paymentName: [
            { required: true, message: "请输入缴费事项名", trigger: "blur" },
            {
              min: 1,
              max: 50,
              message: "长度在 1 到 50 个字符",
              trigger: "blur",
            },
          ],
          price: [
          
          { required: true, message: "请输入费用", trigger: "blur" },
          { validator: checkPositiveNumver, trigger: "blur" },
         
        ],
        
        },
      };
    },
    methods: {
    
      deletePayment(payment){
        this.$confirm(`您确认删除缴费事项 ${payment.paymentName} ?`, '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            paymentApi.deletePaymentById(payment.paymentId).then(response => {
              this.$message({
                type: 'success',
                message: response.message
              });
              this.getPaymentList();
            });
            
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            });          
          });
      },
      savePayment() {
        // 触发表单验证
        this.$refs.paymentFormRef.validate((valid) => {
          if (valid) {
            // 提交请求给后台
            paymentApi.savePayment(this.paymentForm).then(response => {
              // 成功提示
              this.$message({
                message: response.message,
                type: 'success'
              });
              // 关闭对话框
              this.dialogFormVisible = false;
              // 刷新表格
              this.getPaymentList();
            });
          } else {
            console.log("error submit!!");
            return false;
          }
        });
        
      },
      query(id){
      this.dialogFormVisible2 = true;
      this.title2="已缴费学生"
      paymentApi.getIsPayStudentList(this.searchModel,id).then((response) => {
          this.isPayStudentList = response.data.rows;
          this.total = response.data.total;
        });
      
    },
      clearForm() {
        this.paymentForm = {
          paymentIdList: []
        };
        this.$refs.paymentFormRef.clearValidate();
      },

      openEditUI(id) {
        if( id == null){
          this.title = "新增缴费事项";
        }else{
          this.title = "修改缴费事项";
          // 根据id查询用户数据
          paymentApi.getPaymentById(id).then(response => {
            this.paymentForm = response.data;
          });
        }
        this.dialogFormVisible = true;
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
      currentDate() {
        let aData = new Date();
        this.date = aData.getFullYear() + "-" + (aData.getMonth() + 1) + "-" + aData.getDate();
    
      }

    },
    created() {
      this.getPaymentList();
      this.currentDate();
  
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