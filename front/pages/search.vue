<template>
  <div>
    <Product v-bind:data="url_data"></Product>
  </div>
</template>

<script>
export default {
  layout ({ store }) {
    return store.state.user.current === null ? 'beforeLogin' : 'logged-in'
  },
  data({ $store }) {
    return {
      url_data: "search/" + $store.state.keyword,
    }
  },
}
</script>