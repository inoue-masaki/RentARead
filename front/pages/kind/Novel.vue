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
        'kind/' + '新書・文庫・ノベルズ' :
        'kind/' + '新書・文庫・ノベルズ/' + $store.state.user.current.id
      }
    }
  }
</script>