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
        'kind/' + '古書・稀少本' :
        'kind/' + '古書・稀少本/' + $store.state.user.current.id
      }
    }
  }
</script>