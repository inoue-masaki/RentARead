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
        'kind/' + '社会・政治・法律' :
        'kind/' + '社会・政治・法律/' + $store.state.user.current.id
      }
    }
  }
</script>