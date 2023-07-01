<template>
  <div>
    <v-app-bar
      app
      dark
      :clipped-left="clippedLeft"
    >
      <nuxt-link
        to="/"
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
      v-on="on"
      :disabled="!keyword"
      @click="keywordPush"
    >
      <v-icon>
        mdi-magnify
      </v-icon>
    </v-btn>

    <v-spacer/>

      <v-toolbar-items class="ml-2 hidden-ipad-and-down">
        <v-btn
          v-for="(menu, i) in menus"
          :key="`menu-btn-${i}`"
          text
          :class="{ 'hidden-sm-and-down': (menu.title === 'about') }"
        >
          {{ $t(`menus.${menu.title}`) }}
        </v-btn>
      </v-toolbar-items>

      <nuxt-link
        to="/signup"
        class="text-decoration-none"
      >
        <before-login-app-bar-signup-button />
      </nuxt-link>

      <nuxt-link
        to="/login"
        class="text-decoration-none"
      >
        <before-login-app-bar-login-button />
      </nuxt-link>

      <nuxt-link
        to="/trial"
        class="text-decoration-none"
      >
        <before-login-app-bar-trial-button />
      </nuxt-link>

    </v-app-bar>
    </div>
  </template>

  <script>
  export default {
    props: {
      menus: {
        type: Array,
        default: () => []
      },
      clippedLeft: {
      type: Boolean,
      default: false
    }
    },
    // 追加
    data ({ $config: { appName } }) {
      return {
        appName,
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