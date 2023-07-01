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
        'kind/' + '語学・辞典・年鑑' :
        'kind/' + '語学・辞典・年鑑/' + $store.state.user.current.id
      }
    }
  }
</script>