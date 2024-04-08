const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  id: state => state.user.id,
  money: state => state.user.money,
  phone: state => state.user.phone,
  status: state => state.user.status,
  num: state => state.user.num,
  menuList: state => state.user.menuList,

  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,   
  permission_routes: state => state.permission.routes
}
export default getters
