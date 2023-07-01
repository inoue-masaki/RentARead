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
        'kind/' + 'ゲーム攻略本' :
        'kind/' + 'ゲーム攻略本/' + $store.state.user.current.id
      }
    }
  }
</script>