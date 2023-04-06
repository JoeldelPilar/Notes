<template>
  <div class="logged-in-page">
    <section>
      <h2>The logged in view, se create and edit docs here!</h2>
      <button id="logout-btn" @click="logout">Logout</button>
    </section>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import NoteService from '../services/NoteService'

function logout() {
  localStorage.removeItem('token')
}

onMounted(async () => {
  const docs = await NoteService.getDocuments()
  console.log(docs)
})
</script>

<style scoped>
.logged-in-page {
  border: 2px solid red;
}
</style>
