<template>
    <div>
      <!-- 搜索栏 -->
      <el-dialog
        
        :visible.sync="dialogFormVisible"
      >
      
  
      <!-- 结果列表 -->
      <el-card>
        <el-table :data="isPayList" stripe style="width: 100%">
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
          <el-table-column prop="price" label="价格（/元）" >
          </el-table-column>
          <el-table-column prop="time" label="缴费时间" >
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
    </el-dialog>
    </div>
  </template>
  
  <script>
  import paymentApi from "@/api/paymentManage";
  import roleApi from "@/api/roleManage";
  import { mapGetters } from 'vuex'
  export default {
    name:"isPay",
    computed: {
    ...mapGetters([
      'id',
      'money'
    ])
  },
    data() {
     
      return {
        isPayList: [],
        formLabelWidth: "130px",
        dialogFormVisible: true,
      
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        isPayList: [],
       
      };
    },
    methods: {
    
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getIsPayList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getIsPayList();
      },
      getIsPayList() {
        paymentApi.getIsPayList(this.searchModel,this.id).then((response) => {
          this.isPayList = response.data.rows;
          this.total = response.data.total;
        });
      },

     
    },
    created() {
      this.getIsPayList();

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