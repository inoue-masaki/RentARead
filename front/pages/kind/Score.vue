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
        'kind/' + '楽譜・スコア・音楽書' :
        'kind/' + '楽譜・スコア・音楽書/' + $store.state.user.current.id
      }
    }
  }
</script>