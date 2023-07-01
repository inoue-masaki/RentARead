<template>
    <v-container>
      <nuxt-child />
    </v-container>
  </template>

  <script>
  export default {
    layout: 'project',

    validate ({ store,route }) {
        return !!store.state.project.current && route.name !== 'project'
    }
  }
  </script>