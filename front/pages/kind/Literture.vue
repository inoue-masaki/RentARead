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
      'kind/' + '文学・評論' :
      'kind/' + '文学・評論/' + $store.state.user.current.id
    }
  }
}
</script>