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
        'kind/' + '人文・思想' :
        'kind/' + '人文・思想/' + $store.state.user.current.id
      }
    }
  }
</script>