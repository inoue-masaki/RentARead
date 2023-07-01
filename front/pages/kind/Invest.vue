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
        'kind/' + '投資・金融・会社経営' :
        'kind/' + '投資・金融・会社経営/' + $store.state.user.current.id
      }
    }
  }
</script>