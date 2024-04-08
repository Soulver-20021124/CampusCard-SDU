import request from '@/utils/request'

export default{
  getUserList(searchModel){
    return request({
      url: '/user/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        username: searchModel.username,
        phone: searchModel.phone
      }
    });
  },
  addUser(user){
    return request({
      url: '/user',
      method: 'post',
      data: user
    });
  },
  updateUser(user){
    return request({
      url: '/user',
      method: 'put',
      data: user
    });
  },
  updateRecord(id){
    return request({
      url: `/user/${id}`,
      method: 'put'
      
    });
  },

  updateLoss(oldPassword,id){
    return request({
      url: `/user/loss`,
      method: 'post',
      params:{
        oldPassword: oldPassword,
        id: id,
      }
      
    });
  },

  updateStatus(oldPassword,id){
    return request({
      url: `/user/release`,
      method: 'post',
      params:{
        oldPassword: oldPassword,
        id: id,
      }
      
    });
  },

  updateNum(oldPassword,id){
    return request({
      url: `/user/num`,
      method: 'post',
      params:{
        oldPassword: oldPassword,
        id: id,
      }
      
    });
  },
  saveUser(user){
    if(user.id == null && user.id == undefined){
      return this.addUser(user);
    }
    return this.updateUser(user);
  },
  getUserById(id){
    return request({
      //url: '/user/' + id,
      url: `/user/${id}`,
      method: 'get'
    });
  },
  deleteUserById(id){
    return request({
      url: `/user/${id}`,
      method: 'delete'
    });
  },
  getPie(id){
    return request({
      url: `/record/pie/${id}`,
      method: 'get'
      
    });

  },
  changePassword(oldPassword,newPassword,newPassword2,id){
    return request({
        url: '/user/password',
        method: 'post',
        params:{
          oldPassword: oldPassword,
          newPassword: newPassword,
          newPassword2: newPassword2,
          id: id,
        }
      });
   
  },
  getInformationList(searchModel,id){
    return request({
      url: '/information/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        id:id
      }
    });
  },
  deleteInformationById(id){
    return request({
      url: `/information/${id}`,
      method: 'delete'
    });
  },
  getUserMoney(id){
    return request({
      //url: '/user/' + id,
      url: `/user/money/${id}`,
      method: 'get'
    });
  },
  getUserPhone(id){
    return request({
      //url: '/user/' + id,
      url: `/user/phone/${id}`,
      method: 'get'
    });
  },
  getUserStatus(id){
    return request({
      //url: '/user/' + id,
      url: `/user/status/${id}`,
      method: 'get'
    });
  },
}