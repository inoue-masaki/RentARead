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
      'kind/' + 'ボーイズラブ' :
      'kind/' + 'ボーイズラブ/' + $store.state.user.current.id
    }
  }
}
</script>
