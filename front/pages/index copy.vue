<template>
  <div>
    <v-row dense>
      <div
        v-for="(product, i) in products"
        :key="i"
      >
        <v-col>
          <v-card
            height = "422px"
            width = "255px"
            class = "ma-2"
          >
            <div>
              <template v-if="product.image.url !== null">
                <v-img
                  :src="product.image.url"
                ></v-img>
              </template>
              <template v-else>
                <v-img v-bind:src="image_src"/>
              </template>
            </div>
              <v-card-title class="text-h6">
                {{product.title | omittedText }}
              </v-card-title>
              <v-card-subtitle>
                {{product.author | omittedText }}
              </v-card-subtitle>
              <v-row>
                <v-col>
                  <v-rating
                    v-model='product.avg_star'
                    readonly
                    color="orange"
                    class="ml-2"
                    half-increments
                    size="18"
                  ></v-rating>
                </v-col>
                <v-col>
                  <div class="text-left mt-1">
                    ({{ product.star_count }})
                  </div>
                </v-col>
              </v-row>
            <v-btn
              outlined
              text
              @click="to_detail(product.id)"
              class="mx-2"
            >
              詳細
            </v-btn>
          </v-card>
        </v-col>
      </div>
    </v-row>
  </div>
</template>

<script>
  export default {
    layout: 'beforeLogin',
    data({ $store }) {
      return {
        image_src: require('@/assets/images/no_image.png'),
        products:[],
        redirectPath: $store.state.loggedIn.rememberPath,
        loginPath: $store.state.beforeLogin.loginPath,
        logged_in_user: $store.state.user.current,
        borrowPath: $store.state.loggedIn.borrowPath,
        detailPath: $store.state.loggedIn.detailPath,
        star: null
      }
    },
    // props: ["data"],
    mounted: async function() {
      await this.$axios.$get('/api/v1/books')
        .then(res => {
          this.products = res
          // this.star = res['avg_star']
        })
        .catch(function (error) {
          console.log(error);
      })
    },
    methods: {
      to_login() {
          this.$router.push(this.loginPath)
          const msg = 'レビューを書くには、まずはログインしてください'
          // const color = 'info'
          // $store.dispatch('getToast', { msg, color })
          return this.$store.dispatch("getToast", { msg })
      },
      newLine(content){
        return content.replace(/\\n/g,'\n')
      },
      to_detail: function(id){
        this.$store.dispatch('getBookId',id)
        this.$router.push(this.detailPath)
      }
    },
    filters: {
      omittedText(text) {
      return text.length > 9 ? text.slice(0, 9) + "‥" : text;
      },
    },
  }
</script>

<style>
.output{
  white-space: wrap;
  word-wrap: break-word;
}
</style>