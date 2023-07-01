<template>
  <div>
    <v-textarea
      label="説明"
      v-model="reviewupdate"
      :counter="280"
      :rules="reviewRules"
      outlined
      dense
      no-resize
      max-width="500px"
    />
  </div>
</template>

<script>
export default {
  data: () => ({
      reviewRules: [
        v => (v && v.length <= 280) || '説明は280文字までです',
      ],
    }),
  props: {
    reviewField: null
  },
  computed: {
    reviewupdate:{
      get(){
        return this.reviewField
      },
      set(value){
        this.$emit('update:reviewField',value)
      }
    }
  }
}
</script>