<template>
  <v-container fluid>
    <v-row justify="center">
      <!-- 画像フォーマット -->
      <v-col cols="12">
        <div>
          <p class="text-h4" width:900px>借りている本</p>
          <v-data-table
          :headers="headers"
          :items="products"
          :page.sync="page"
          :items-per-page="itemsPerPage"
          sort-by="created_at"
          hide-default-footer
          class="elevation-1"
          @page-count="pageCount = $event"
          >
            <!-- <template v-slot:[`item.id`]="{ item }">
              <a :href="item.url"> {{ item.id }}</a>
              <router-link to="/login"></router-link>
            </template> -->
            <template v-slot:[`item.borrower`]="{ item }">
              <v-btn @click="return_book(item)">返却する</v-btn>
            </template>
          </v-data-table>

          <div class="text-center pt-2">
            <v-pagination
              v-model="page"
              :length="pageCount"
            ></v-pagination>
          </div>
        </div>
      </v-col>
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
</template>

<script>
  export default {
    layout: 'logged-in',
    data ({ $store }) {
      return {
        params: {
          id: $store.state.user.current.id,
        },
        page: 1,
        pageCount: 0,
        itemsPerPage: 10,
        headers: [
          {
            align: 'start',
            sortable: false,
          },
          { text: '名前', value: 'title' },
          { text: '著者', value: 'author' },
          { text: '出版社', value: 'publisher' },
          { text: '種類', value: 'kind' },
          // { text: '登録日', value: 'created_at' },
          // { text: '借りている人', value: 'updated_at' },
          { text: '貸出日', value: 'updated_at' },
          { text: '', value: 'borrower' },
        ],
        products:[],
        borrowPath: $store.state.loggedIn.borrowPath,
        homePath: $store.state.loggedIn.homePath
      }
    },
    methods: {
      getColor (calories) {
        if (calories < 1) return 'red'
        else if (calories < 11) return 'orange'
        else return 'blue'
      },
      // return_book(item){
      //   this.$axios.$get('/api/v1/books/show',this.params)
      //   .then(res => {this.products = res})
      //   .catch(error => console.log(error))
      // },
      return_book: function(params) {
        this.$axios.$patch('/api/v1/books/return',params)
        .then(response => this.authSuccessful(response))
      },
      authSuccessful(){
        this.$router.push(this.homePath)
        // location.reload();
        const msg = "本を返却しました"
        return this.$store.dispatch("getToast", { msg })
      },
    },
     mounted:function() {
      this.$axios.$get('/api/v1/books/show/' + this.params.id)
      .then(res => {this.products = res})
      .catch(error => console.log(error))
    }
  }
</script>