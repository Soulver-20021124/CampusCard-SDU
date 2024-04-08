import request from '@/utils/request'

export default{
  getStudentList(searchModel){
    return request({
      url: '/student/list',
      method: 'get',
      params:{
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        studentName: searchModel.studentName,
      }
    });
  },
  updateInfo(student){
    return request({
      url: '/student/update',
      method: 'put',
      data: student
    });

  },
  getStudentById(id){
    return request({
      url: `/student/${id}`,
      method: 'get'
    });

  },
  exportExcel(){
    return request({
      url: '/student/export',
      method: 'get'
    });

  }
}