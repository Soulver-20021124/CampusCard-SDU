import request from '@/utils/request'

export default{
  getSeatList(searchModel){
    return request({
      url: '/library/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        seatFloor: searchModel.seatFloor,
        seatName: searchModel.seatName,
        
      }
    });
  },
  
  
  getSeatById(id){
    return request({
      url: `/library/${id}`,
      method: 'get'
    });
  },
  deleteSeatById(id){
    return request({
      url: `/library/${id}`,
      method: 'delete'
    });
  },
  chooseSeat(seatId,userId){
    return request({
        url: `/library/choose`,
        method: 'post',
        params:{
            seatId:seatId,
            userId:userId,
        }
      });
  },
  getBar(id){
    return request({
      url: `/library/bar/${id}`,
      method: 'get'
      
    });

  },

  getMySeat(searchModel,id){
    return request({
      url: '/library/mySeat',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        seatName: searchModel.seatName,
        id:id
      }
    });
  },

  cancelSeat(seatId,userId){
    return request({
        url: `/library/cancel`,
        method: 'post',
        params:{
            seatId:seatId,
            userId:userId,
        }
      });
  },
  

}