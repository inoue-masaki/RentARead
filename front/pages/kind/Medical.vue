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
        'kind/' + '医学・薬学・看護学・歯科学' :
        'kind/' + '医学・薬学・看護学・歯科学/' + $store.state.user.current.id
      }
    }
  }
</script>