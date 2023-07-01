<template>
  <div>
    <v-text-field
      v-model="setEmail"
      :counter="max"
      :rules="rules"
      :label=this.email_label
      :placeholder="form.placeholder"
      outlined
    />
    </div>
  </template>

  <script>
  export default {
    name: 'user-form-email',
    props: {
      email: {
        type: String,
        default: ''
      },
      noValidation: {
        type: Boolean,
        default: false
      }
    },
    data ({ $store }) {
      return {
        locale :$store.state.locale,
        email_label: this.locale = 'ja' ? "メールアドレスを入力" :"Email",
        rules: [
          v => !!v || '',
          v => /.+@.+\..+/.test(v) || ''
        ]
      }
    },
    computed: {
      setEmail: {
        get () { return this.email },
        set (newVal) { return this.$emit('update:email', newVal) }
      },
      form () {
        const placeholder = this.noValidation ? undefined : 'your@email.com'
        return { placeholder }
      }
    }
  }
  </script>