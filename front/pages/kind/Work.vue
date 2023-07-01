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
        'kind/' + '資格・検定・就職' :
        'kind/' + '資格・検定・就職/' + $store.state.user.current.id
      }
    }
  }
</script>