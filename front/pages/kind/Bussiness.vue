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
      'kind/' + 'ビジネス・経済' :
      'kind/' + 'ビジネス・経済/' + $store.state.user.current.id
    }
  }
}
</script>