<template>
  <v-app>
    <before-login-app-bar
    clipped-left
    />
    <project-navigation-drawer
        :drawer.sync="drawer"
      />
    <v-main>
      <app-toaster />
      <nuxt />
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'LayoutsBeforeLogin',
  middleware: ['logged-in-redirect'],

}
</script>

<style>
.output {
  white-space: pre-line;
}
</style>