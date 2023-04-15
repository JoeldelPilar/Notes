<template>
  <section class="container-loggedin">
    <h1 class="main-header">Notes</h1>
    <span>{{ message }}</span>
    <LoggedinPage />
  </section>
</template>

<script setup>
import LoggedinPage from '../components/LoggedinPage.vue'
import NoteService from '../services/NoteService'
import { onMounted, ref } from 'vue'
import { useLogginTokenStore } from '../stores/logginToken'

const message = ref('')

const store = useLogginTokenStore()

const params = new URLSearchParams(window.location.search)
const token = params.get('token')
const loggedin = store.loginToken

onMounted(async () => {
  if (token) {
    try {
      const result = await NoteService.loginSuccess(token)
      const uuid = result.data[0].uuid
      store.loginLogout(uuid)
    } catch (error) {
      console.log('Error message: ', error)
    }
  } else if (loggedin.value) {
    message.value = "Let's get started creating docs!"
  } else {
    message.value = 'Something went wrong when logging in, please try again.'
  }
})
</script>
<style scoped>
.container-loggedin {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #1c1c1c;
  color: #6e6e6e;
}

.main-header {
  font-size: 4rem;
  margin-block-end: 1rem;
  letter-spacing: 0.15rem;
  color: #6e6e6e;
  font-weight: 300;
}
</style>
