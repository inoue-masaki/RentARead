<template>
  <nuxt-child />
</template>

<script>
export default {
  layout ({ store }) {
    return store.state.user.current === null ? 'beforeLogin' : 'logged-in'
  }
}
</script>