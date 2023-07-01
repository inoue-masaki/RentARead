<template>
  <div>
    <v-text-field
      v-model="updatepublisher"
      :counter="50"
      :rules="nameRules"
      label="出版社"
      required
    ></v-text-field>
  </div>
</template>

<script>
export default {
  data: () => ({
      valid: true,
      nameRules: [
        v => (v && v.length <= 30) || '出版社名は30文字までです',
      ],
    }),

  props: {
    publishField: null
  },

  methods: {
    validate () {
      this.$refs.form.validate()
    },
    reset () {
      this.$refs.form.reset()
    },
    resetValidation () {
      this.$refs.form.resetValidation()
    },

    updateValue(e) {
        this.$emit("input", e.target.value);
    },
  },

  computed: {
      updatepublisher:{
      get(){
        return this.publishField
      },
      set(value){
        this.$emit('update:publishField',value)
      }
    }
  }
}
</script>

