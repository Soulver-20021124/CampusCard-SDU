import request from '@/utils/request'

export default{
  getPaymentList(searchModel){
    return request({
      url: '/payment/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        paymentName: searchModel.paymentName,
      }
    });
  },
  getIsPayList(searchModel,id){
    return request({
      url: '/isPay/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        paymentName: searchModel.paymentName,
        id:id
      }
    });
  },
  getIsPayStudentList(searchModel,id){
    return request({
      url: '/isPay/list2',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        id:id
      }
    });
  },
  addPayment(payment){
    return request({
      url: '/payment',
      method: 'post',
      data: payment
    });
  },
  updatePayment(payment){
    return request({
      url: '/payment',
      method: 'put',
      data: payment
    });
  },
  savePayment(payment){
    if(payment.paymentId == null && payment.paymentId == undefined){
      return this.addPayment(payment);
    }
    return this.updatePayment(payment);
  },
  getPaymentById(id){
    return request({
      url: `/payment/${id}`,
      method: 'get'
    });
  },
  deletePaymentById(id){
    return request({
      url: `/payment/${id}`,
      method: 'delete'
    });
  },
  rechargeById(money,id){
    return request({
        url: '/user/recharge',
        method: 'post',
        params:{
          
          money: money,
          id: id,
        }
      });
   
  },
  buyPaymentById(paymentId,id){
    return request({
      url: '/payment/pay',
      method: 'post',
      params:{
        paymentId: paymentId,
        id:id
      }
    });
  },
  getAllPaymentList(){
    return request({
      url: '/payment/all',
      method: 'get'
    });
  },
}