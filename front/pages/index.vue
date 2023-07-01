<template>
  <div>
    <Product
      v-bind:data="url_data"
    ></Product>
  </div>
</template>

<script>
export default {
  layout: 'beforeLogin',
  data() {
    return {
      url_data: ""
    }
  }
}
</script>