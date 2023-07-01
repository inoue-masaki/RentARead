<template>
  <div>
    <p class="text-h4">本を貸し出す</p>
    <v-container fluid>
      <v-row justify="center">
        <!-- 画像フォーマット -->
        <v-col cols="4">
          <div class="file">
            <div class="gazou">
              <!-- <v-img :src="params.book.uploadFile" width=420px height="auto"/>
               -->
              <div v-if="url">
                  <v-img v-bind:src="url" max-width="400px" height="auto" ></v-img>
              </div>
            </div>

            <input type="file" ref="preview" @change="uploadFile" accept="image/*">
          </div>
        </v-col>

        <!-- フォーム -->
        <v-col cols="4">
          <div class="text-right">
            <ExibitFormTitle v-bind:title-field.sync="titleExhibit"/>
            <ExibitFormPublisher v-bind:publish-field.sync="publishExhibit"/>
            <ExibitFormAuthor v-bind:author-field.sync="authorExhibit"/>
            <ExibitFormDesc v-bind:desc-field.sync="descExhibit"/>
          </div>
        </v-col>
      </v-row>

      <v-row justify="center">
        <ExibitFormRadio v-bind:kind-field.sync="kindExhibit"/>
      </v-row>
      <v-row justify="center">
        <v-btn
          :disabled="title === ''"
          @click="submitForm"
          width=120px
        >
          {{ $t(`pages.registration`) }}
        </v-btn>
      </v-row>

      <div class="my-5">
        <v-row justify="center">
          <nuxt-link
            to="/main"
            class="text-decoration-none"
          >
            <v-btn
              width=120px
            >
              戻る
            </v-btn>
          </nuxt-link>
        </v-row>
      </div>
    </v-container>
  </div>
</template>


<script>
  export default {
    layout: 'logged-in',
    data({ $store }){
      return {
        allowSpaces: false,
        match: 'Foobar',
        model: 'Foobar',
        lentPath: $store.state.loggedIn.lentPath,
        url:"",
        params: {
          book:
            {
              title: '',
              publisher: '',
              author: '',
              desc: '',
              kind: '',
              lender: $store.state.user.current.id,
              image: []
            }
        }
      }
    },
    computed: {
      rules () {
        const rules = []

        if (this.max) {
          const rule =
            v => (v || '').length <= this.max ||
              `A maximum of ${this.max} characters is allowed`

          rules.push(rule)
        }

        if (!this.allowSpaces) {
          const rule =
            v => (v || '').indexOf(' ') < 0 ||
              'No spaces are allowed'

          rules.push(rule)
        }

        if (this.match) {
          const rule =
            v => (!!v && v) === this.match ||
              'Values do not match'

          rules.push(rule)
        }

        return rules
      },
      titleExhibit:{
        set(value){
          this.params.book.title = value
        }
      },
      publishExhibit:{
        set(value){
          this.params.book.publisher = value
        }
      },
      authorExhibit:{
        set(value){
          this.params.book.author = value
        }
      },
      descExhibit:{
        set(value){
          this.params.book.desc = value
        }
      },
      kindExhibit:{
        set(value){
          this.params.book.kind = value
        }
      },
    },
    methods: {
      // selectedFile(e) {
      //   e.preventDefault();
      //   this.params.book.uploadFile = e.target.files[0];
      // },
      uploadFile(e){
        // this.params.book.image = this.$refs.preview.files[0];
 
        // this.url = URL.createObjectURL(this.params.book.image)

        e.preventDefault();
        this.params.book.image = e.target.files[0];
        const file = this.$refs.preview.files[0];
        this.url = URL.createObjectURL(file)
      },
      async submitForm() {
        let formData = new FormData();
        formData.append("book[title]", this.params.book.title)
        formData.append("book[publisher]", this.params.book.publisher)
        formData.append("book[author]", this.params.book.author)
        formData.append("book[kind]", this.params.book.kind)
        // formData.append("book[desc]", this.params.book.desc.replace(/\n/g,'\\n'))
        formData.append("book[desc]", this.params.book.desc)
        formData.append("book[image]", this.params.book.image)
        formData.append("book[lender]", this.params.book.lender)


         //ajax //結果をcontentに返す
        await this.$axios.post('/api/v1/books',formData)
          .then(response => this.authSuccessful(response))
          .catch(error => this.authFailure(error.response))
      },
      authSuccessful(){
        this.$router.push(this.lentPath)
        const msg = "本を貸し出しました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
      authFailure({ response }){
        if(response && response.status === 404){
        // トースター出力
        const msg = "失敗しました"
        const color = "error"
        return this.$store.dispatch("getToast",{ msg,color })
      }
      //エラー処理
    }
  }
}

</script>

<style scoped>
.form{
    display: block;
    text-align: right;
}
.my-2{
  text-align: center;
}



</style>