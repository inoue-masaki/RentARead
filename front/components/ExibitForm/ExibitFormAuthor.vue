<template>
  <div>
    <v-text-field
      v-model="authorupdate"
      :counter="10"
      :rules="nameRules"
      label="著者"
      required
    ></v-text-field>
  </div>
</template>

<script>
export default {
  data: () => ({
      valid: true,
      nameRules: [
        v => (v && v.length <= 50) || '著者名は50文字までです',
      ],
    }),

  props: {
    authorField: null
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
      authorupdate:{
      get(){
        return this.authorField
      },
      set(value){
        this.$emit('update:authorField',value)
      }
    }
  }
}
</script>

