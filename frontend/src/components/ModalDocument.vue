<template>
  <article>
    <h2>{{ title }}</h2>
    <div v-html="body"></div>
    <span>
      Author:
      <strong>{{ author }}</strong>
    </span>
  </article>
</template>

<script setup>
import { defineProps } from 'vue'

defineProps({
  title: String,
  body: String,
  author: String
})
</script>

<style scoped></style>
