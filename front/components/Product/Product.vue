<template>
  <div>
    <v-row dense>
      <div
        v-for="(product, i) in products"
        :key="i"
      >
        <v-col>
          <v-card
            height = "440px"
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
                  {{product.author | omittedText}}
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
                    ({{ product.star_count }}件)
                  </div>
                </v-col>
              </v-row>
            <v-row>
              <v-col>
                <v-btn
                  outlined
                  text
                  @click="to_detail(product.id)"
                  class="mx-2"
                >
                  詳細
                </v-btn>
              </v-col>
              <v-col>
                <div
                  class="text-right"
                >
                  <div v-if="$store.state.user.current != null">
                    <div v-if="product.favarite == false">
                      <v-btn
                        icon
                        @click="on_favarite(product.id)"
                      >
                        <v-icon
                        color="red"
                        >
                        mdi-heart-outline
                        </v-icon>
                      </v-btn>
                    </div>
                    <div v-else>
                      <v-btn
                        icon
                        @click="off_favarite(product.id)"
                      >
                        <v-icon
                        color="red"
                        >
                          mdi-heart
                        </v-icon>
                      </v-btn>
                    </div>
                  </div>
                </div>
              </v-col>
            </v-row>
          </v-card>
        </v-col>
      </div>
    </v-row>
  </div>
</template>

<script>
  export default {
    data({ $store }) {
      return {
        products:[],
        image_src: require('@/assets/images/no_image.png'),
        borrowPath: $store.state.loggedIn.borrowPath,
        detailPath: $store.state.loggedIn.detailPath,
        favoritePath: $store.state.loggedIn.favoritePath,
        userPath: $store.state.user.current,
      }
    },
    props: ["data"],
    mounted: function() {
      this.$axios.$get('/api/v1/books/' + this.data)
        .then(res => {this.products = res;})
        .catch(function (error) {
          console.log(error);
      })
    },
    methods: {
      authSuccessful(){
        this.$router.push(this.borrowPath)
        const msg = "本を借りました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
      newLine(content){
        return content.replace(/\\n/g,'\n')
      },
      to_detail: function(id){
        this.$store.dispatch('getBookId',id)
        this.$router.push(this.detailPath)
      },
      on_favarite: function(id){
        this.$axios.$post('/api/v1/favarites/on',{
          auth:
          {
            user_id: this.$store.state.user.current.id,
            book_id: id
          }
        })
        this.$router.push(this.favoritePath)
        const msg = "本をお気に入りにしました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
      off_favarite: function(id){
        this.$axios.$delete('/api/v1/favarites/off',{
          data: {
            user_id: this.$store.state.user.current.id,
            book_id: id
          }
        })
        this.$router.push(this.favoritePath)
        const msg = "本のお気に入りを解除しました"
        const color = "success"
        return this.$store.dispatch("getToast", { msg,color })
      },
    },
    filters: {
      omittedText(text) {
        let count = 0;
        let result = '';

        for (let i = 0; i < text.length; i++) {
          const char = text.charAt(i);
          const charCode = char.charCodeAt(0);
          count += (charCode >= 0 && charCode <= 125) ? 1 : 2;

          if (count > 20) {
            result += '..';
            break;
          } else {
            result += char;
          }
        }

        return result;
      }
      // omittedText(text) {
      //   return text.length > 9 ? text.slice(0, 9) + "‥" : text;
      // }
    }
}
</script>