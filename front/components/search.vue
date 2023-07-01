<template>
  <div>
    <v-text-field
      single-line
      solo
      rounded-lg
      dense
      hide-details
      light
    ></v-text-field><br>
    <v-btn
      icon
      v-on="on"
    >
      <v-icon>
        mdi-magnify
      </v-icon>
    </v-btn>
  </div>
</template>

<script>
export default {
}
</script>