<template>
    <div>
      <!-- 搜索栏 -->
      <el-dialog
        
        :visible.sync="dialogFormVisible"
        
      >
      
  
      <!-- 结果列表 -->
      <el-card>
        <el-table :data="mySeat" stripe style="width: 100%">
          <el-table-column label="#" width="80">
            <template slot-scope="scope">
              <!-- (pageNo-1) * pageSize + index + 1 -->
              {{
                (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1
              }}
            </template>
          </el-table-column>
          
         
          <el-table-column prop="seatFloor" label="层数" width="180">
          </el-table-column>
          <el-table-column prop="seatName" label="号码" >
          </el-table-column>
          <el-table-column  label="操作" width="180">
            <template slot-scope="scope">
            <el-button @click="cancel(scope.row.seatId,id)" type="primary">取消预约</el-button>
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
    </el-dialog>
    </div>
  </template>
  
  <script>
  import seatApi from "@/api/seatManage";

  import { mapGetters } from 'vuex'
  export default {
    name:"mySeat",

    computed: {
    ...mapGetters([
      'id',
      'money'
    ])
  },
 
    data() {
     
      return {
        mySeat: [],
        formLabelWidth: "130px",
        dialogFormVisible: true,
      
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        mySeat: [],
       
      };
    },
    methods: {
      choose(seatId,userId){
        seatApi.chooseSeat(seatId,userId).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
           
            this.getSeatList();
          });

    },

    cancel(seatId,userId){
        seatApi.cancelSeat(seatId,userId).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
           
            this.getSeatList();
          });

    },
     
     
      
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getMySeat();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getMySeat();
      },
      getMySeat() {
        seatApi.getMySeat(this.searchModel,this.id).then((response) => {
          this.mySeat = response.data.rows;
          this.total = response.data.total;
        });
      },
      open(){
        this.dialogFormVisible=true;
      }
     

     
    },
    created() {
      this.getMySeat();
  
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