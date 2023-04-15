<template>
  <section class="container">
    <h1>Welcome to Notes by deva11y!</h1>
    <StartPage class="startpage" />
    <!-- <LoggedinPage /> -->
  </section>
</template>

<script setup>
import StartPage from '@/components/StartPage.vue'
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #151515;
}

.container h1 {
  font-size: 3rem;
  margin-bottom: 2rem;
  letter-spacing: 0.15rem;
  color: #6e6e6e;
}
</style>
