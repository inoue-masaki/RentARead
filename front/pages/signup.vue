<template>
  <v-container fluid>
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          {{ $t(`pages.signup`) }}
        </h1>
      </v-col>
      <v-card
        flat
        width="80%"
        max-width="320"
        color="transparent"
      >
        <v-form
          ref="form"
          v-model="isValid"
        >
          <user-form-name
            :name.sync="params.auth.name"
          />
          <user-form-email
            :email.sync="params.auth.email"
          />
          <user-form-password
            :password.sync="params.auth.password"
          />
          <v-btn
            :disabled="!isValid || loading"
            :loading="loading"
            block
            color="myblue"
            class="white--text"
            @click="signup"
          >
          {{ $t(`pages.registration`) }}
          </v-btn>
        </v-form>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'beforeLogin',
  data ({ $store }) {
    return {
      isValid: false,
      loading: false,
      params:
      {
        auth:
            {
              name: '',
              email: '',
              password: ''
            }
      },
      // redirectPath: $store.state.loggedIn.signupPath,
      redirectPath: $store.state.loggedIn.rememberPath,
      loggedInHomePath: $store.state.loggedIn.homePath
    }
  },
  methods: {
    async signup() {
      this.loading = true
      // if(this.isValid){
        await this.$axios.$post('/api/v1/auth_token/user_create',this.params)
          .then(response => this.authSuccessful(response))
          .catch(error => this.authFailure(error.response))
      // }
      this.loading = false
    },
    async authSuccessful(){
      this.$axios.$post('/api/v1/auth_token',this.params)
      .then(response => this.signupSuccessful(response))
    },
    async signupSuccessful(response){
      await this.$auth.login(response)
      this.$router.push(this.redirectPath)

      //記憶ルートを初期値に戻す
      this.$store.dispatch('getRememberPath',this.loggedInHomePath)
    },
    authFailure({ response }){
      if(response && response.status === 404){
        // トースター出力
        const msg = "ユーザーが見つかりません"
        return this.$store.dispatch("getToast",{ msg })
      }
      //エラー処理
    }
  }
}
</script>