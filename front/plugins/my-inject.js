class MyInject {
  constructor (ctx) {
    this.app = ctx.app
  }

  pageTitle (routeName) {
    const jsonPath = `pages.${routeName.replace(/-/g, '.')}`
    const title = this.app.i18n.t(jsonPath)
    return title
    // return (typeof (title) === 'object') ? title.index : title
  }

  dataFormat (dateStr){
    const dateTimeFormat = new Intl.DateTimeFormat(
      'ja', { dateStyle: 'medium', timeStyle: 'short' }
    )
    return dateTimeFormat.format(new Date(dateStr))
  }

  // プロジェクトリンク
  projectLinkTo (id, name = 'project-id-dashboard') {
    return { name, params: { id } }
  }
}
//injectはオリジナルクラスのこと
//inject('呼び出し名')で呼び出せる
//第一引数を'my'とした場合"$my"で呼び出す
//ここのappは上記コンストラクタで入れたcontext内のappを指す
  export default ({ app }, inject) => {
    inject('my', new MyInject(app))
  }