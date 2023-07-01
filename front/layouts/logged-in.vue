<template>
  <v-app>
    <logged-in-app-bar
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
  middleware: ['authentication'],
}
</script>

<style>
.output {
  white-space: pre-line;
}
</style>