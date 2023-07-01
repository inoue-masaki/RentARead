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
        'kind/' + '教育・学参・受験' :
        'kind/' + '教育・学参・受験/' + $store.state.user.current.id
      }
    }
  }
</script>