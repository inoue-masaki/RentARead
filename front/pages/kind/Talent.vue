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
        'kind/' + 'タレント写真集' :
        'kind/' + 'タレント写真集/' + $store.state.user.current.id
      }
    }
  }
</script>