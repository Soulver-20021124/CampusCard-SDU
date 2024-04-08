import { login, logout, getInfo } from '@/api/user'
import { getToken, setToken, removeToken } from '@/utils/auth'
import { resetRouter } from '@/router'

const getDefaultState = () => {
  return {
    token: getToken(),
    name: '',
    avatar: '',
    id:'',
    phone:'',
    num:'',
    status:0,
    money:0,
    
    menuList: []
  }
}

const state = getDefaultState()

const mutations = {
 
  UPDATE:(state,Money)=>{
     
    const parsedMoney = parseFloat(Money);
  if (!isNaN(parsedMoney)) {
    state.money = state.money + parsedMoney;
  }
   
  },
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  SET_ID: (state, id) => {
    state.id = id
  },
  SET_STATUS: (state, status) => {
    state.status = status
  },
  SET_NUM: (state, num) => {
    state.num = num
  },
  SET_MONEY: (state, money) => {
    state.money = null!=window.sessionStorage.getItem('money')?window.sessionStorage.getItem('money'):money
  },
  SET_PHONE: (state, phone) => {
    state.phone = null!=window.sessionStorage.getItem('phone')?window.sessionStorage.getItem('phone'):phone
  },
  SET_MENU_LIST: (state, menuList) => {
    state.menuList = menuList
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { username, password } = userInfo
    return new Promise((resolve, reject) => {
      login({ username: username.trim(), password: password }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.token)
        setToken(data.token)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // get user info
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getInfo(state.token).then(response => {
        const { data } = response

        if (!data) {
          reject('Verification failed, please Login again.')
        }

        const { name, avatar, menuList ,id,money,phone,status,num} = data

        commit('SET_NAME', name)
        commit('SET_AVATAR', avatar)
        commit('SET_ID', id)
        commit('SET_MONEY', money)
        commit('SET_PHONE', phone)
        commit('SET_STATUS', status)
        commit('SET_NUM', num)
        commit('SET_MENU_LIST', menuList)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },

  // user logout
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        removeToken() // must remove  token  first
        resetRouter()
        commit('RESET_STATE')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      removeToken() // must remove  token  first
      commit('RESET_STATE')
      resolve()
    })
  },

  updateMoney(context){
    
    context.commit('UPDATE')
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

