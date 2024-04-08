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
        <el-col :span="4" align="right">
          <el-button
            @click="openEditUI(null)"
            type="primary"
            icon="el-icon-plus"
           
          >上架商品</el-button>
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
               <div
                style="display: inline-block; float: right; cursor: pointer"
                @click="deleteGood(item)"
                
              >
                <el-tooltip effect="dark" content="删除" placement="bottom">
                  <i class="el-icon-delete" />
                </el-tooltip>
          </div>
            <div
            style="display: inline-block; float: right; cursor: pointer" 
            @click="openEditUI(item.goodId)"
            
          >
            <el-tooltip effect="dark" content="修改" placement="bottom">
              <i class="el-icon-edit" />
            </el-tooltip>
          </div>
          
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
      <el-form :model="goodForm" ref="goodFormRef" :rules="rules">
        <el-form-item
          label="商品图片"
          prop="avatar"
          :label-width="formLabelWidth"
        >
        <el-upload
          class="avatar-uploader"
          action="http://localhost:9999/file/uploads"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          >
          <img v-if="goodForm.avatar" :src="goodForm.avatar" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
        <el-form-item
          label="商品名"
          prop="goodName"
          :label-width="formLabelWidth"
        >
          <el-input v-model="goodForm.goodName" autocomplete="off"></el-input>
        </el-form-item>
       
     
        <el-form-item label="商家" :label-width="formLabelWidth">
          <el-input v-model="goodForm.business" autocomplete="off"></el-input>
        </el-form-item>
        
       
        <el-form-item
          label="价格（/元）"
          prop="price"
          :label-width="formLabelWidth"
        >
          <el-input v-model="goodForm.price" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="上架时间"
          prop="time"
          :label-width="formLabelWidth"
        >
          <el-input v-if="goodForm.time==null?goodForm.time=this.date:goodForm.time=goodForm.time" v-model="goodForm.time" autocomplete="off" disabled></el-input>
         
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveGood">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import goodApi from "@/api/goodManage";
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
      goodList: [],
      formLabelWidth: "130px",
      goodForm: {
       
      },
      dialogFormVisible: false,
      title: "",
      total: 0,
      searchModel: {
        pageNo: 1,
        pageSize: 10,
      },
      goodList: [],
      rules: {
        goodName: [
          { required: true, message: "请输入商品名", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
        price: [
          
          { required: true, message: "请输入商品价格", trigger: "blur" },
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
    deleteGood(good){
      this.$confirm(`您确认删除商品 ${good.goodName} ?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          goodApi.deleteGoodById(good.goodId).then(response => {
            this.$message({
              type: 'success',
              message: response.message
            });
            this.getGoodList();
          });
          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
    },
    saveGood() {
      // 触发表单验证
      this.$refs.goodFormRef.validate((valid) => {
        if (valid) {
          // 提交请求给后台
          goodApi.saveGood(this.goodForm).then(response => {
            // 成功提示
            this.$message({
              message: response.message,
              type: 'success'
            });
            // 关闭对话框
            this.dialogFormVisible = false;
            // 刷新表格
            this.getGoodList();
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
      
    },
    clearForm() {
      this.goodForm = {
        goodIdList: []
      };
      this.$refs.goodFormRef.clearValidate();
    },
    openEditUI(id) {
      if( id == null){
        this.title = "新增商品";
      }else{
        this.title = "修改商品";
        // 根据id查询用户数据
        goodApi.getGoodById(id).then(response => {
          this.goodForm = response.data;
        });
      }
      this.dialogFormVisible = true;
    },
    handleSizeChange(pageSize) {
      this.searchModel.pageSize = pageSize;
      this.getGoodList();
    },
    handleCurrentChange(pageNo) {
      this.searchModel.pageNo = pageNo;
      this.getGoodList();
    },
    handleAvatarSuccess(res){
      this.goodForm.avatar = res;
    },
    getGoodList() {
      goodApi.getGoodList(this.searchModel).then((response) => {
        this.goodList = response.data.rows;
        this.total = response.data.total;
      });
    },
    currentDate() {
        let aData = new Date();
        this.date = aData.getFullYear() + "-" + (aData.getMonth() + 1) + "-" + aData.getDate();
    
      }
  },
  created() {
    this.getGoodList();
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
.image {
    width: 100%;
    display: block;
  }
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>