<template>
    <v-container>
      <v-btn
        v-if="!!currentProject"
        small
        plain
        color="primary"
        :to="$my.projectLinkTo(currentProject.id,dashboardPath)"
      >

        <v-icon
          left
        >
          mdi-chevron-double-left
        </v-icon>
        {{ $my.pageTitle( dashboardPath ) }}に戻る
      </v-btn>
      <nuxt-child />
    </v-container>
  </template>

  <script>
  export default {
    layout: 'logged-in',

    validate ({ route }) {
        return route.name !== 'account'
    },

    data(){
      return {
        dashboardPath: 'project-id-dashboard'
      }
    },

    conputed:{
      currentProject(){
        return this.$store.state.project.current
      }
    }
  }
  </script>