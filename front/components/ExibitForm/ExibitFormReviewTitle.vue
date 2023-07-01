<template>
  <div>
    <v-text-field
      label="タイトル"
      v-model="ReviewTitleUpdate"
      :counter="30"
      :rules="titleRules"
      outlined
      dense
    />
  </div>
</template>

<script>
export default {
  data: () => ({
      titleRules: [
        v => (v && v.length <= 30) || 'タイトルは30文字までです',
      ],
    }),
  props: {
    reviewTitleField: null
  },
  computed: {
    ReviewTitleUpdate :{
      get(){
        return this.reviewTitleField
      },
      set(value){
        this.$emit('update:reviewTitleField',value)
      }
    }
  }
}
</script>