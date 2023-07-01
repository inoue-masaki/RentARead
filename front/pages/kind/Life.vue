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
        'kind/' + '暮らし・健康・子育て' :
        'kind/' + '暮らし・健康・子育て/' + $store.state.user.current.id
      }
    }
  }
</script>
