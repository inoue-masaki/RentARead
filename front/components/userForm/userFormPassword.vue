<template>
  <div>
    <v-text-field
      v-model="setPassword"
      :rules="form.rules"
      :counter="!noValidation"
      :hint="form.hint"
      :label=this.password_label
      :placeholder="this.min_label"
      :hide-details="noValidation"
      outlined
      :append-icon="toggle.icon"
      :type="toggle.type"
      autocomplete="on"
      @click:append="show = !show"
    />
  </div>
  </template>

  <script>
  export default {
    data ({ $store }) {
      return {
        locale :$store.state.locale,
        password_label: this.locale = 'ja' ? "パスワードを入力" :"password",
        min_label: this.locale = 'ja' ? "8文字以上" :"8 characters or more",
        msg_label: this.locale = 'ja' ? "半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます" :"You can use single-byte alphanumeric characters, hyphens, and underscores.",
        min: this.show ? 'mdi-eye' : 'mdi-eye-off',
        show: false
      }
    },
    props: {
      password: {
        type: String,
        default: ''
      },
      noValidation: {
        type: Boolean,
        default: false
      }
    },
    computed: {
      setPassword: {
        get () { return this.password },
        set (newVal) { return this.$emit('update:password', newVal) }
      },
      form () {
        const min = this.min_label
        const msg = `${min} ${this.msg_label}`
        const required = v => !!v || ''
        const format = v => /^[\w-]{8,72}$/.test(v) || msg

        const rules = this.noValidation ? [required] : [format]
        const hint = this.noValidation ? undefined : msg
        const placeholder = this.noValidation ? undefined : min
        return { rules, hint, placeholder }
      },
      toggle () {
        const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
        const type = this.show ? 'text' : 'password'
        return { icon, type }
      }
    }
  }
  </script>