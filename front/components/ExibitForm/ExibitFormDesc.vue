<template>
  <div>
    <v-textarea
      label="説明欄"
      v-model="descupdate"
    />
    <!-- </textarea> -->
  </div>
</template>

<script>
export default {
  data: () => ({
      nameRules: [
        v => (v && v.length <= 800) || '説明は800文字までです',
      ],
    }),
  props: {
    descField: null
  },
  computed: {
      descupdate:{
      get(){
        return this.descField
      },
      set(value){
        this.$emit('update:descField',value)
      }
    }
  }
}
</script>

