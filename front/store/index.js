const homePath = 'main'
const loginPath = 'login'
const borrowPath = 'borrow_book_list'
const lentPath = 'lent_book_list'
const detailPath = 'detail'
const favoritePath = 'favorite'

export const state = () => ({
  locales: ['en', 'ja'],
  locale: 'ja',
  beforeLogin: {
    loginPath :{
      name: loginPath
    }
  },
  loggedIn: {
    homePath : {
      name: homePath
    },
    rememberPath: {
      name: homePath,
      params: {}
    },
    signupPath: {
      name: loginPath
    },
    borrowPath: {
      name: borrowPath
    },
    lentPath: {
      name: lentPath
    },
    detailPath: {
      name: detailPath
    },
    favoritePath : {
      name: favoritePath
    },
    //ログイン後アクセス不可ルート一覧
    redirectPaths: [
      'signup',
      'login'
    ]
  },
  project: {
    current: null,// ecにはいらないので後で消す
    list: [
      { id: 1, name: 'MyProject01', updatedAt: '2020-04-01T12:00:00+09:00' },
      { id: 2, name: 'MyProject02', updatedAt: '2020-04-05T12:00:00+09:00' },
      { id: 3, name: 'MyProject03', updatedAt: '2020-04-03T12:00:00+09:00' },
      { id: 4, name: 'MyProject04', updatedAt: '2020-04-04T12:00:00+09:00' },
      { id: 5, name: 'MyProject05', updatedAt: '2020-04-01T12:00:00+09:00' }
    ]
  },
  user: {
    current: null
  },
  auth: {
    token: null,
    expires: 0,
    payload: {},
    user: {},
      // name: "サンプルユーザー"
    // },
  },
  toast: {
    msg: null,
    color: 'error',
    timeout: 4000
  },
  keyword: null,
  book_id: null
})

export const getters = {}

export const mutations = {
  //2022103add getProject
  setProjectList (state,payload){
    state.project.list = payload
  },
  //
  setCurrentProject (state,payload){
    state.project.current = payload
  },
  setCurrentUser (state, payload) {
    state.user.current = payload
  },
  setAuthToken (state, payload) {
    state.auth.token = payload
  },
  setAuthExpires (state, payload) {
    state.auth.expires = payload
  },
  setAuthPayload (state, payload) {
    state.auth.payload = payload
  },
  setToast (state, payload) {
    state.toast = payload
  },
  setRememberPath (state, payload) {
    state.loggedIn.rememberPath = payload
  },
  setKeyword (state, keyword) {
    state.keyword = keyword
  },
  setBookId (state, id) {
    state.book_id = id
  },
}

export const actions = {
  //2022103add getProject
  getProjectList({ commit },projects){
    projects = projects || []
    commit('setProjectList',projects)
  },
  //
  getCurrentProject ({state,commit}, params){
    //20221003change for addProject
      let currentProject = null
      if(params && params.id){
        const id = Number(params.id)
        currentProject = state.project.list.find(project => project.id === id || null)
      }
    //
    commit('setCurrentProject',currentProject)
  },
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getAuthToken ({ commit }, token) {
    commit('setAuthToken', token)
  },
  getAuthExpires ({ commit }, expires) {
    expires = expires || 0
    commit('setAuthExpires', expires)
  },
  getAuthPayload ({ commit }, jwtPayload) {
    jwtPayload = jwtPayload || {}
    commit('setAuthPayload', jwtPayload)
  },
  getToast ({ commit },{msg,color,timeout}) {
    color = color || 'info'
    timeout = timeout || 4000
    commit('setToast',{msg,color,timeout})
  },
  //ログイン前ユーザーがアクセスしたルートを記憶する
  getRememberPath ({state,commit},{name,params}){
    if(state.loggedIn.redirectPaths.includes(name)){
      name = state.loggedIn.homePath.name
    }
    params= params || {}
    commit ("setRememberPath",{name,params})
  },
  getKeyword ({ commit }, keyword) {
    commit('setKeyword', keyword)
  },
  getBookId ({ commit }, id) {
    commit('setBookId', id)
  }
}
