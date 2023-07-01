<template>
  <div class="ml-12">
    <v-container>
      <v-row justify="center">
        <v-col align-self="center" cols="12" md="4"> <!-- Responsive layout here -->
          <v-row>
            <div>
              <div>
                <template v-if="this.image !== null">
                  <v-img
                    :src= "this.image"
                    max-width="370px"
                    max-height="370px"
                    dense
                    outlined
                  ></v-img>
                </template>
                <template v-else>
                  <v-img
                    v-bind:src="image_src"
                    max-width="370px"
                    max-height="370px"
                    dense
                    outlined
                  ></v-img>
                </template>
              </div>
            </div>
          </v-row>
          <v-row>
            <v-col>
              <v-rating
                v-model='product.avg_star'
                readonly
                color="orange"
                class="ml-10"
                half-increments
                density="compact"
              ></v-rating>
            </v-col>
            <!-- <v-col>
              <div class="mt-2 d-md-block d-sm-none">
                {{ product.star_count }}個の評価
              </div>
            </v-col> -->
            <!-- <v-col>
              <div class="text-left mt-1">
                ({{ product.star_count }})
              </div>
            </v-col> -->
          </v-row>
        </v-col>

        <!-- フォーム -->
        <v-col cols="12" md="4"> <!-- Responsive layout here -->
          <div class="d-block">
            <v-list-item-content>
              <v-card-text>
                <div>{{product.kind}}</div>
                <div class="text-h4 text--primary ">
                  <p>{{ text }}</p>
                  <!-- <p>{{ text | omittedText }}</p> -->
                </div>
                <div class="text-subtitle-1">
                  {{product.author}}(著)
                  <v-divider :thickness="4" vertical class="border-opacity-25"></v-divider>
                  {{product.publisher}}
                </div>
                <div class="text-subtitle-1">
                  <div class="output">{{ newLine(this.desc) }}</div>
                </div>
              </v-card-text>

              <div class="mt-8">
                <v-row>
                  <v-col>
                    <template v-if="product.borrower === null">
                      <template v-if="$store.state.user.current !== null">
                        <v-card-actions>
                          <v-btn
                            width=180px
                            @click="lend"
                          >
                            借りる
                          </v-btn>
                        </v-card-actions>
                      </template>
                      <template v-else>
                        <v-card-actions>
                          <v-btn
                            width=180px
                            @click="to_login()"
                          >
                            借りる
                          </v-btn>
                        </v-card-actions>
                      </template>
                    </template>
                    <template v-else>
                      <div>
                        貸出中
                      </div>
                    </template>
                  </v-col>
                </v-row>
              </div>
            </v-list-item-content>
          </div>
        </v-col>
      </v-row>

      <v-row justify="center">
        <v-col cols="12" md="6">
          <template>
            <div>
                <div
                  v-for="(review, i) in reviews"
                  :key="i"
                >
                <v-container>
                  <v-row>
                    <v-card
                      width="800px"
                      class="my-3"
                    >
                      <v-row>
                        <v-col>
                          <v-card-title>{{ review.title }}</v-card-title>
                        </v-col>
                        <v-col>
                          <div class="mt-3">
                            <v-rating
                              v-model="review.star"
                              readonly
                              color="orange"
                              density="compact"
                            ></v-rating>
                          </div>
                        </v-col>
                      </v-row>
                      <v-divider class="border-opacity-25"></v-divider>
                      <v-row>
                        <v-col>
                          <div class="output"><v-card-subtitle>{{ newLine(review.desc) }}</v-card-subtitle></div>
                        </v-col>
                      </v-row>
                    </v-card>
                    <v-row class="justify-end">
                      <v-card-subtitle
                      >{{ review.user_name }} さんのレビュー</v-card-subtitle>
                    </v-row>
                  </v-row>
                </v-container>
                </div>
              </div>
          </template>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" md="5">

        </v-col>
        <v-col cols="12" md="4">
          <v-container>
            <v-row>
                <template v-if="$store.state.user.current !== null">
                  <v-btn
                    color="primary"
                    @click="dialog = true"
                    width=120px
                  >
                    レビューを書く
                  </v-btn>
                </template>
                <template v-else>
                  <v-btn
                    color="primary"
                    @click="to_login"
                    width=120px
                  >
                    レビューを書く
                  </v-btn>
                </template>
            </v-row>
            <v-row>
              <template v-if="$store.state.user.current !== null">
                <v-btn
                  width=120px
                  class="mt-2"
                  @click="to_main"
                >
                  戻る
                </v-btn>
              </template>
              <template v-else>
                <v-btn
                  width=120px
                  class="mt-2"
                  @click="to_index"
                >
                  戻る
                </v-btn>
              </template>
            </v-row>
          </v-container>
        </v-col>
      </v-row>
    </v-container>

      <v-dialog
        v-model="dialog"
        max-width="700px"
        max-height="700px"
      >
        <div color="primary">
            <v-card>
              <v-toolbar
                dark
                color="primary"
              >
                <v-btn
                  icon
                  dark
                  @click="dialog = false"
                >
                  <v-icon>mdi-close</v-icon>
                </v-btn>
                <v-toolbar-title>投稿フォーム</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-toolbar-items>
                  <v-btn
                    variant="text"
                    @click="comment"
                    color="orange"
                    :disabled="!isValid || loading"
                    :loading="loading"
                  >
                    投稿する
                  </v-btn>
                </v-toolbar-items>
              </v-toolbar>
              <v-form
               ref="form"
                v-model="isValid"
              >
                  <div class="mt-15 mx-15 text-center">
                    <ExibitFormReviewTitle v-bind:review-title-field.sync="reviewTitleExhibit"/>
                    <ExibitFormReviewDesc v-bind:review-field.sync="reviewExhibit"/>
                  </div>
                <div class="pb-10 text-center">
                  <v-rating
                    v-model="review_params.star"
                    color="orange"
                    active-color="orange"
                  ></v-rating>
                </div>
              </v-form>
            </v-card>
        </div>
    </v-dialog>
  </div>
</template>

<script>
  export default {
    layout ({ store }) {
      return store.state.user.current === null ? 'beforeLogin' : 'logged-in'
    },
    data({ $store }) {
      return {
        text: "",
        image_src: require('@/assets/images/no_image.png'),
        redirectPath: $store.state.loggedIn.rememberPath,
        loginPath: $store.state.beforeLogin.loginPath,
        logged_in_user: $store.state.user.current,
        borrowPath: $store.state.loggedIn.borrowPath,
        product: [],
        reviews: null,
        image: "",
        dialog: false,
        desc: "",
        book: "",
        title_tmp: "",
        isValid: false,
        loading: false,
        newLine(content){
          return content.replace(/\\n/g,'\n')
        },
        lend_params:
        {
          id: $store.state.book_id,
          lending: null
        },
        review_params:
        {
          title: "",
          desc: "",
          star: null,
          user_id: null,
          book_id: $store.state.book_id
        }
      }
    },
    computed: {
      reviewTitleExhibit:{
        set(value){
          this.review_params.title = value
        }
      },
      reviewExhibit:{
        set(value){
          this.title_tmp = value
        }
      },
    },
    mounted: async function() {
      await this.$axios.$get('/api/v1/books/detail/' + this.lend_params.id)
      .then(res => {
        this.product = res
        this.image = res.image.url
        this.desc = res.desc
        this.text = res.title
        this.$axios.$get('/api/v1/reviews/' + this.lend_params.id)
          .then(res => {
            this.reviews = res
          })
          .catch(error => console.log(error))
          })
        .catch(error => console.log(error))
    },
    methods: {
      to_login() {
          this.$router.push(this.loginPath)
          const msg = 'まずはログインしてください'
          return this.$store.dispatch("getToast", { msg })
      },
      to_index() {
          this.$router.push('/')
      },
      to_main() {
          this.$router.push('/main')
      },
      newLine(content){
        return content.replace(/\\n/g,'\n')
      },
      async comment () {
        this.loading = true
        this.review_params.user_id = this.logged_in_user.id
        this.review_params.desc = this.title_tmp.replace(/\n/g,'\\n')
          await this.$axios.$post('/api/v1/reviews/create',this.review_params)
            .then(response => this.commentSuccessful(response))
            .catch(error => this.authFailure(error.response))
        this.loading = false
      },
      commentSuccessful(response){
        this.reviews.push(response)
        this.dialog = false
        const msg = "コメントを投稿しました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
      lend: function() {
        this.loading = true
        this.lend_params.lending = this.logged_in_user.id
        this.$axios.$patch('/api/v1/books/lending',this.lend_params)
        .then(response => this.lendSuccessful(response))
        .catch(error => this.authFailure(error.response))
        this.loading = false
      },
      lendSuccessful(){
        this.$router.push(this.borrowPath)
        const msg = "本を借りました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
    },
    filters: {
      omittedText(text) {
        return text.length > 9 ? text.slice(0, 9) + "‥" : text;
      }
    }
  }
</script>

<style>
.output{
  white-space: pre-line;
  word-wrap: break-word;
}
</style>