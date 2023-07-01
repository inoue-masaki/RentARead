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
        'kind/' + '旅行ガイド・マップ' :
        'kind/' + '旅行ガイド・マップ/' + $store.state.user.current.id
      }
    }
  }
</script>