<template>
  <v-text-field
    v-model="setName"
    :rules="rules"
    :counter="max"
    :label="this.name_label"
    outlined
  />
</template>

  <script>
  export default {
    props: {
      name: {
        type: String,
        default: ''
      }
    },
    data ({ $store }) {
      const max = 30
      return {
        locale :$store.state.locale,
        name_label: this.locale = 'ja' ? "名前" :"NAME",
        rule_label: this.locale = 'ja' ? "30以下の文字数内で入力してください" :"Please enter within characters",
        max,
        rules: [
          v => !!v || '',
          v => (!!v && max >= v.length) || `${this.rule_label} ${max}`
        ]
      }
    },
    computed: {
    setName: {
      get () { return this.name },
      set (newVal) { return this.$emit('update:name', newVal) }
    }
  }
  }
  </script>