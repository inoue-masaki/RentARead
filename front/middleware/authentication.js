// front/middleware/authentication.js
export default async ({ $auth, store, route, redirect }) => {
  // リダイレクトを必要としないパス
  const notRedirectPaths = ['account', 'project']
  if (notRedirectPaths.includes(route.name)) {
    return false
  }

  // ログイン前ユーザー処理
  if (!$auth.loggedIn()) {
    // ユーザー以外の値が存在する可能性があるので全てを削除する
    await $auth.logout()

    // const msg = 'まずはログインしてください'
    // const color = 'info'
    // console.log(msg, color)
    // // トースター出力
    // store.dispatch('getToast', { msg, color })
    // TODO アクセスルートを記憶
    store.dispatch('getRememberPath', route)
    return redirect('/login')
  }
}
