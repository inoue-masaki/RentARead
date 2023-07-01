export default {
  ssr: false,

  head: {
    title: 'RentARead',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  css: [
  ],

  plugins: [
    'plugins/auth',
    'plugins/axios',
    'plugins/my-inject',
    // 'plugins/nuxt-client-init'
  ],

  components: true,

  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    '@nuxtjs/vuetify',
    '@nuxtjs/moment'
  ],

  moment: {
    locales: ['ja']
  },

  modules: [
    '@nuxtjs/axios',
    'nuxt-i18n',
    '@nuxtjs/moment',
    '@nuxtjs/proxy'
  ],
  publicRuntimeConfig: {
    appName: "RentARead"
  },

  axios: {
    credentials: true
  },

  vuetify: {
    theme: {
      treeShake: true,
      customVariables: ['~/assets/sass/variables.scss'],
      themes: {
        light: {
          primary: '4080BE',
          info: '4FC1E9',
          success: '44D69E',
          warning: 'FEB65E',
          error: 'FB8678',
          background: 'f6f6f4',
          myblue: '1867C0'
        }
      }
    }
  },

  build: {
  },
  css: [
    '~/assets/sass/main.scss' // 追加
  ],
  i18n: {
    locales: ['ja', 'en'],
    defaultLocale: 'ja',
    vueI18n: {
      fallbackLocale: 'ja',
      silentFallbackWarn: true,
      messages: {
        ja: require('./locales/ja.json'),
        en: require('./locales/en.json')
      }
    },
    strategy: 'no_prefix',
  }
}
