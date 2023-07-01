<template>
  <div>
    <Product v-bind:data="url_data"></Product>
  </div>
</template>

<script>
export default {
  layout: 'logged-in',
  data({ $store }) {
    return {
      url_data: "favorite/" + $store.state.user.current.id
    }
  }
}
</script>