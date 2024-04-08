<template>
  <div>
    <!-- 搜索栏 -->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input
            v-model="searchModel.reason"
            placeholder="消费原因"
            clearable
          ></el-input>
          <el-input
            v-model="searchModel.userName"
            placeholder="消费人姓名"
            clearable
          ></el-input>
          <el-button
            @click="getRecordList"
            type="primary"
            round
            icon="el-icon-search"
            >查询</el-button
          >

          
        </el-col>
         <el-col :span="4" align="right">
              <el-button
                @click="exportExcel"
                type="primary"
                icon="el-icon-files"
              >导出Excel</el-button>
            </el-col> 
        
        
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-card>
      <el-table :data="recordList" stripe style="width: 100%">
        <el-table-column label="#" width="80">
          <template slot-scope="scope">
            <!-- (pageNo-1) * pageSize + index + 1 -->
            {{
              (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1
            }}
          </template>
        </el-table-column>
        
       
        <el-table-column prop="reason" label="消费原因" width="180">
        </el-table-column>
       
        <el-table-column prop="cost" label="金额" width="180">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.reason=='充值'">{{ scope.row.cost }}</el-tag>
            <el-tag v-else type="danger">{{ -scope.row.cost }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="userName" label="消费人姓名" >
        </el-table-column>
        <el-table-column prop="time" label="消费日期">
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

    
  </div>
</template>

<script>
import recordApi from "@/api/recordManage";
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters([
      'id'
    ])
  },
  data() {
   
    return {
      recordList: [],
      formLabelWidth: "130px",
      recordForm: {
        recordIdList: []
      },
      
      dialogFormVisible: false,
      title: "",
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      recordList: [],
      
    };
  },
  methods: {
    deleteRecord(record){
      this.$confirm(`您确认删除用户 ${record.userName}的这条消费记录 ?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          recordApi.deleteRecordById(record.recordId).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
            this.getRecordList();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
    },
    
    clearForm() {
      this.recordForm = {
        recordIdList: []
      };
      this.$refs.recordFormRef.clearValidate();
    },
    
    
    handleSizeChange(pageSize) {
      this.searchModel.pageSize = pageSize;
      this.getRecordList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getRecordList();
    },
    
    getRecordList() {
      recordApi.getRecordList(this.searchModel).then((response) => {
        this.recordList = response.data.rows;
        this.total = response.data.total;
      });
    },
    exportExcel(){
      recordApi.exportExcel();
      this.$message({
              type: 'success',
              message: "导出成功"
            });
    }
  },
  created() {
    this.getRecordList();
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
</style>