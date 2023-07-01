<template>
  <div>
    <Product v-bind:data="kind_data"></Product>
  </div>
</template>

<script>
  export default {
    data({ $store }) {
      return {
        kind_data: $store.state.user.current === null ?
        'kind/' + '歴史・地理' :
        'kind/' + '歴史・地理/' + $store.state.user.current.id
      }
    }
  }
</script>