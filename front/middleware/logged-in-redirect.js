// front/middleware/logged-in-redirect.js
export default ({ $auth, store, route, redirect }) => {
  // ログイン済ユーザーをリダイレクトさせる
  const redirectPaths = store.state.loggedIn.redirectPaths
  if ($auth.loggedIn()) {
    return redirect(store.state.loggedIn.homePath)
  }
}
