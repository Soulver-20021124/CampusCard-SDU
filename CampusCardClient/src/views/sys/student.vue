<template>
    <div>
      <!-- 搜索栏 -->
      <el-card id="search">
        <el-row>
          <el-col :span="20">
            <el-input
              v-model="searchModel.studentName"
              placeholder="用户名"
              clearable
            ></el-input>
            <el-input
              v-model="searchModel.studentNum"
              placeholder="学号"
              clearable
            ></el-input>
            <el-button
              @click="getStudentList"
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
              >导出学生表</el-button>
            </el-col>
          
         
        </el-row>
      </el-card>
  
      <!-- 结果列表 -->
  
      <el-card>
        <el-table :data="studentList" stripe style="width: 100%">
          <el-table-column label="#" width="80">
            <template slot-scope="scope">
              <!-- (pageNo-1) * pageSize + index + 1 -->
              {{
                (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1
              }}
            </template>
          </el-table-column>
         
          <el-table-column prop="studentNum" label="学号" width="180">
          </el-table-column>
          <el-table-column prop="studentName" label="学生姓名" width="180">
          </el-table-column>
          <el-table-column prop="gender" label="性别" width="120">  
          </el-table-column>
          <el-table-column prop="dept" label="所属院系" width="180">
          </el-table-column>
          <el-table-column prop="grade" label="年级" width="120">
          </el-table-column>
          <el-table-column prop="phone" label="电话 " width="180">
          </el-table-column>
          <el-table-column prop="userId" label="用户Id" >
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
    
    </div>
  </template>
  
  <script>
  import studentApi from "@/api/studentManage";
  import roleApi from "@/api/roleManage";
  export default {
    data() {
     
      return {
        roleList: [],
        formLabelWidth: "130px",
       
        total: 0,
        searchModel: {
          pageNo: 1,
          pageSize: 10,
        },
        studentList: [],
        
      };
    },
    methods: {
    
     
      handleSizeChange(pageSize) {
        this.searchModel.pageSize = pageSize;
        this.getStudentList();
      },
      handleCurrentChange(pageNo) {
        this.searchModel.pageNo = pageNo;
        this.getStudentList();
      },
      getStudentList() {
        studentApi.getStudentList(this.searchModel).then((response) => {
          this.studentList = response.data.rows;
          this.total = response.data.total;
        });
      },
      exportExcel(){
      studentApi.exportExcel();
      this.$message({
              type: 'success',
              message: "导出成功"
            });
    }
    },
    created() {
      this.getStudentList();
    },
  };
  </script>
  
  <style>
   .time {
      font-size: 13px;
      color: #999;
    }
    
    .bottom {
      margin-top: 13px;
      line-height: 12px;
    }
  
    .button {
      padding: 0;
      float: right;
    }
  
    .image {
      width: 100%;
      display: block;
    }
  
    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }
    
    .clearfix:after {
        clear: both
    }
  #search .el-input {
    width: 200px;
    margin-right: 10px;
  }
  .el-dialog .el-input {
    width: 85%;
  }
  </style>