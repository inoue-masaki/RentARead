<template>
  <v-app-bar
    app
    :clipped-left="clippedLeft"
    dark
  >

    <!-- <slot name="navigation-toggle-button"></slot> -->
    <nuxt-link
      to="/main"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>
    <app-title />

    <v-spacer/>

    <v-text-field
      single-line
      solo
      rounded-lg
      dense
      hide-details
      light
      v-model="keyword"
    ></v-text-field>
  

    <v-btn
      icon
      :disabled="!keyword"
      @click="keywordPush"
    >
      <v-icon>
        mdi-magnify
      </v-icon>
    </v-btn>

    <v-spacer/>

    <!-- <nuxt-link
      to="/exhibit"
      class="text-decoration-none"
    >
      <v-btn
        icon
      >
        <v-icon>
          mdi-content-save-move
        </v-icon>
      </v-btn>
    </nuxt-link> -->

    <v-btn
      text
      color="white"
      to="/exhibit"
      class="ml-2 font-weight-bold"
    >
      本を貸し出す
    </v-btn>

    <!-- <nuxt-link
        to="/borrow_book_list"
        class="text-decoration-none"
      > -->
      <!-- <v-btn
        icon
      >
        <v-icon>
          mdi-cart
        </v-icon>
      </v-btn> -->
    <v-btn
      text
      class="ml-2 font-weight-bold"
      color="white"
      to="/lent_book_list"
    >
      貸し出した本
    <!-- {{ $t('pages.login') }} -->
    </v-btn>
    <!-- </nuxt-link> -->

    <!-- <nuxt-link
      to="/lent_book_list"
      class="text-decoration-none"
    > -->
      <!-- <v-btn
        icon
      >
        <v-icon>
          mdi-cart
        </v-icon>
      </v-btn> -->

    <v-btn
      text
      class="ml-2 font-weight-bold"
      color="white"
      to="/borrow_book_list"
    >
      借りている本
    </v-btn>
    <!-- </nuxt-link> -->
    <v-btn
      text
      class="ml-2 font-weight-bold"
      color="white"
      to="/favorite"
    >
      お気に入り
    </v-btn>

    <logged-in-app-bar-account-menu />

  </v-app-bar>
</template>

<script>
export default {
  props: {
    clippedLeft: {
      type: Boolean,
      default: false
    }
  },
  data({ $store }){
    return {
      homePath: $store.state.loggedIn.homePath,
      keyword:''
    }
  },
  methods: {
    keywordPush(){
      this.$store.dispatch('getKeyword',this.keyword)
      this.$router.push({
      path: `/search`
    });
    }
  }
}
</script>