<template>
    <div>
      <!-- 搜索栏 -->
      <el-dialog
        
        :visible.sync="dialogFormVisible"
      >
      
  
      <!-- 结果列表 -->
      
      <el-row
        v-for="item in informationList"
        :key="item.id"
        :span="5"
        style="margin-bottom: 10px"
        :offset="1"
      >
      <el-card class="box-card">
        <div slot="header" class="clearfix">
            <span>{{item.title}}</span>
            <el-button style="float: right; padding: 3px 0" type="text" @click="deleteInformation(item)">删除通知</el-button>
        </div>
        <div class="text item">
            {{item.content}}
        </div>
        </el-card>
      
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
    </el-dialog>
    </div>
  </template>
  
  <script>
  import paymentApi from "@/api/paymentManage";
  import userApi from "@/api/userManage";
  import roleApi from "@/api/roleManage";
  import { mapGetters } from 'vuex'
  export default {
    name:"infomation",
    computed: {
    ...mapGetters([
      'id',
      'money'
    ])
  },
    data() {
     
      return {
        informationList: [],
        formLabelWidth: "130px",
        dialogFormVisible: true,
      
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        informationList: [],
       
      };
    },
    methods: {
    
      deleteInformation(information){
        
            userApi.deleteInformationById(information.informationId).then(response => {
              this.$message({
                type: 'success',
                message: response.message
              });
              this.getInformationList();
            });
            
      },
     
      
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getInformationList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getInformationList();
      },
      getInformationList() {
        userApi.getInformationList(this.searchModel,this.id).then((response) => {
          this.informationList = response.data.rows;
          this.total = response.data.total;
        });
      },

     
    },
    created() {
      this.getInformationList();
     
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
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 800px;
  }
  </style>