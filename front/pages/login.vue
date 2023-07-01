<template>
  <v-container fluid>
    <v-row
      justify="center"
    >
      <v-col
        cols="12"
        class="my-8 text-center"
      >
        <h1 class="text-h5 font-weight-bold">
          {{ $t(`pages.login`) }}
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
          <user-form-email
            :email.sync="params.auth.email"
          />
          <user-form-password
            :password.sync="params.auth.password"
          />
          <v-card-text class="px-0">
            <v-btn
              :disabled="!isValid || loading"
              :loading="loading"
              block
              color="myblue"
              class="white--text"
              @click="login"
            >
            {{ $t(`pages.log-in`) }}
            </v-btn>
          </v-card-text>
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
      //確認のため。後で消す
      params: { auth:
                { email: '', password: '' }
      },
      redirectPath: $store.state.loggedIn.rememberPath,
      loggedInHomePath: $store.state.loggedIn.homePath
    }
  },
  methods: {
    async login () {
      this.loading = true
      if(this.isValid){
        await this.$axios.$post('/api/v1/auth_token',this.params
        , { withCredentials: true })
          .then(response => this.authSuccessful(response))
          .catch(error => this.authFailure(error.response))
      }
      this.loading = false
    },
    authSuccessful(response){
      console.log('authSuccessful',response)
      this.$auth.login(response)
      this.$router.push(this.redirectPath)

      //記憶ルートを初期値に戻す
      this.$store.dispatch('getRememberPath',this.loggedInHomePath)
    },
    authFailure({ response }){
      if(response && response.status == 404){
        // トースター出力
        const msg = "ユーザーが見つかりません"
        return this.$store.dispatch("getToast",{ msg })
      }
      //エラー処理
      }
    }
  }

</script>