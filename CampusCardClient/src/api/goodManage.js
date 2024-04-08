import request from '@/utils/request'

export default{
  getGoodList(searchModel){
    return request({
      url: '/good/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        goodName: searchModel.goodName,
      }
    });
  },
  addGood(good){
    return request({
      url: '/good',
      method: 'post',
      data: good
    });
  },
  updateGood(good){
    return request({
      url: '/good',
      method: 'put',
      data: good
    });
  },
  saveGood(good){
    if(good.goodId == null && good.goodId == undefined){
      return this.addGood(good);
    }
    return this.updateGood(good);
  },
  getGoodById(id){
    return request({
      url: `/good/${id}`,
      method: 'get'
    });
  },
  deleteGoodById(id){
    return request({
      url: `/good/${id}`,
      method: 'delete'
    });
  },
  buyGoodById(goodId,id){
    return request({
      url: '/good/buy',
      method: 'post',
      params:{
        goodId: goodId,
        id:id
      }
    });
  },
  getAllGoodList(){
    return request({
      url: '/good/all',
      method: 'get'
    });
  },
}