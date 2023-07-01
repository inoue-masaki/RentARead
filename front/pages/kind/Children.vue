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
      'kind/' + '絵本・児童書' :
      'kind/' + '絵本・児童書/' + $store.state.user.current.id
    }
  }
}
</script>