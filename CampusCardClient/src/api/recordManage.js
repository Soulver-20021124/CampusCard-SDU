import request from '@/utils/request'

export default{
  getRecordList(searchModel){
    return request({
      url: '/record/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        reason: searchModel.reason,
        userName: searchModel.userName,
        
      }
    });
  },
  getSingleRecordList(searchModel,id){
    return request({
      url: '/record/list2',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        reason: searchModel.reason,
        id:id
      }
    });
  },
  
  getRecordById(id){
    return request({
      url: `/record/${id}`,
      method: 'get'
    });
  },
  deleteRecordById(id){
    return request({
      url: `/record/${id}`,
      method: 'delete'
    });
  },
  
  getAllGoodList(){
    return request({
      url: '/record/all',
      method: 'get'
    });
  },
  exportExcel(){
    return request({
      url: '/user/export',
      method: 'get'
    });

  },
  exportSingleExcel(id){
    return request({
      url: `/user/export/${id}`,
      method: 'get'
    });

  },
  refundRecordById(id){
    return request({
      url: `/record/refund/${id}`,
      method: 'put'
    });
  },
  getRefundList(searchModel){
    return request({
      url: '/record/refundList',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        reason: searchModel.reason,
        userName: searchModel.userName,
        
      }
    });
  },
  agreeRefund(id){
    return request({
      url: `/record/agree/${id}`,
      method: 'put'
    });
  },
  disagreeRefund(id){
    return request({
      url: `/record/disagree/${id}`,
      method: 'put'
    });
  },
  

}