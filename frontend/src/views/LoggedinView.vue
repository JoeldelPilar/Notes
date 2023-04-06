<template>
  <section>
    <h1>Welcome to Notes by deva11y!</h1>
    <span>{{ message }}</span>
    <LoggedinPage />
  </section>
</template>

<script setup>
import LoggedinPage from '../components/LoggedinPage.vue'
import NoteService from '../services/NoteService'
import { onMounted, ref } from 'vue'

const message = ref('')

const params = new URLSearchParams(window.location.search)
const token = params.get('token')
const loggedin = ref(localStorage.getItem('token'))

onMounted(async () => {
  if (token) {
    try {
      const result = await NoteService.loginSuccess(token)
      const uuid = result.data[0].uuid
      localStorage.setItem('token', uuid)
    } catch (error) {
      console.log('Error message: ', error)
    }
  } else if (loggedin.value) {
    message.value = 'You successfully logged in!'
  } else {
    message.value = 'Something went wrong when logging in, please try again.'
  }
})
</script>
