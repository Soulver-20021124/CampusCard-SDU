<template>
    <div>
      <div id="myChart" :style="{width: '1500px', height: '300px'}">

      </div>


        <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input
            v-model="searchModel.seatName"
            placeholder="座位号"
            clearable
          ></el-input>
          <el-select v-model="searchModel.seatFloor" placeholder="请选择层数" clearable>
           <el-option label="1" value="1"></el-option>
           <el-option label="2" value="2"></el-option>
           <el-option label="3" value="3"></el-option>
           <el-option label="4" value="4"></el-option>
           <el-option label="5" value="5"></el-option>
           <el-option label="6" value="6"></el-option>
           <el-option label="7" value="7"></el-option>
         </el-select>
          
          <el-button
            @click="getSeatList"
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
              >查看我已预约的座位</el-button
            >
        </el-col>
        
      </el-row>
    </el-card>

        <el-row>
      <el-col
        v-for="item in seatList"
        :key="item.id"
        :span="5"
        style="margin-bottom: 10px"
        :offset="1"
      >
        <el-card>
          <div slot="header" class="clearfix">
            <i class="el-icon-user" /><span style="margin-left: 5px">{{
              item.seatName
            }}</span>
           
          </div>
          <div>
            <ul class="role-info">
              <li>
                <div class="role-left">描述：位于图书馆{{ item.seatFloor }}层,{{ item.seatName }} 处 </div>
              </li>
              <li>
                <div class="role-left">
                  
                  使用情况：{{ item.userName }} 
                  <el-tag v-model="item.status" v-if="item.status == '使用中'" type="danger">使用中</el-tag>
                  <el-tag v-else type="success">未使用</el-tag>
           
                </div>
              </li>
            </ul>
          </div>
          <div
            style="display: inline-block; float: right; cursor: pointer"
            @click="choose(item.seatId,id)"
            
          >
            <el-tooltip effect="dark" content="预约" placement="bottom">
              <i class="el-icon-check" />
            </el-tooltip>
          </div>
         
        </el-card>
      </el-col>
    </el-row>

    <mySeat v-if="openDialog" ref="mySeat" @dialogClose="closeDialog"></mySeat>

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
import * as echarts from 'echarts';
import mySeat from "./mySeat.vue";
import seatApi from "@/api/seatManage";
import { mapGetters } from 'vuex'
export default {
  components: {mySeat},
    computed: {
    ...mapGetters([
      'id'
    ])
  },
  data() {
    
    return {
      
      formLabelWidth: "130px",
      seatForm: {
        seatIdList: []
      },
      dialogFormVisible: false,
      title: "",
      openDialog:false,
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      seatList: [],
     
    };
  },
  mounted() {
        seatApi.getBar(this.id).then(res=>{
  
  // 基于准备好的dom，初始化echarts实例
  let myChart = echarts.init(document.getElementById('myChart'))
  myChart.resize({
    width:1500,
    height:300
  })
  // 绘制图表
  myChart.setOption({
    title: {
      text: '图书馆各层座位使用情况',
      left: 'center'
    },
    legend: {
    
    orient: 'horizontal',
    right: 200,
    top: 5,
    bottom: 20,
    data: ['图书馆每层总座位数', '图书馆每层未被使用座位数']
    // ...
  },
    
    
   
    xAxis: {
    type: 'category',
    data: ['图书馆1层', '图书馆2层', '图书馆3层', '图书馆4层', '图书馆5层', '图书馆6层', '图书馆7层'],
   
  },
  yAxis: {
    type: 'value'
  },
  
 
  series: [
 

    {
      name:'图书馆每层总座位数',
      type: 'bar',
      data: [26, 24, 20, 25, 23, 25, 30],
      barGap: '20%',
      barCategoryGap: '40%',
      label: {
        show: true,//开启显示
        position: 'top',//柱形上方
      }

      
    },
    {
      
      name:'图书馆每层未被使用座位数',
      type: 'bar',
      data: res.data,
      label: {
        show: true,//开启显示
        position: 'top',//柱形上方
      }
      
    },
  ]
  })
})
;

        
    
     
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
    
    deleteSeat(seat){
      this.$confirm(`您确认删除用户 ${seat.seatName} ?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          seatApi.deleteSeatById(seat.seatId).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
            this.getSeatList();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
    },
    saveSeat() {
      // 触发表单验证
      this.$refs.seatFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
          seatApi.saveSeat(this.seatForm).then(response => {
            // 成功提示
            this.$message({
              message: response.message,
              type: 'success'
            });
            // 关闭对话框
            this.dialogFormVisible = false;
            // 刷新表格
            this.getSeatList();
          });
        } else {
          console.log("error submit!!");
          return false;
        }
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
    closeDialog(){
      this.openDialog=false;
    },
    clearForm() {
      this.seatForm = {
        seatIdList: []
      };
      this.$refs.seatFormRef.clearValidate();
    },
    
    handleSizeChange(pageSize) {
      this.searchModel.pageSize = pageSize;
      this.getSeatList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getSeatList();
    },
    getSeatList() {
      seatApi.getSeatList(this.searchModel).then((response) => {
        this.seatList = response.data.rows;
        this.total = response.data.total;
      });
    },
    

  },
  created() {
    this.getSeatList();
   
  },
};
</script>

<style>
 .role-left {
    font-size: 15px;
    color: #000000;
  }
  
  .role-info {
    margin-top: 5px;
    line-height: 80px;
  }

  .button {
    padding: 0;
    float: right;
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