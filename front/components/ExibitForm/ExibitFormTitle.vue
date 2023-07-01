<template>
  <div>
    <v-text-field
      v-model="updatetitle"
      :counter="99"
      :rules="nameRules"
      label="タイトル"
      required
    ></v-text-field>
</div>
</template>

<script>
export default {
  data: () => ({
      valid: true,
      nameRules: [
        v => !!v || 'タイトルは必須です',
        v => (v && v.length <= 100) || 'タイトルは100文字までです',
      ],
    }),

  props: {
    titleField: null
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
      updatetitle:{
      get(){
        return this.titleField
      },
      set(value){
        this.$emit('update:titleField',value)
      }
    }
  }
}
</script>

