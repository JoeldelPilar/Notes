<template>
  <div v-if="showLogin">
    <form class="login-form" @submit.prevent="login">
      <label class="visually-hidden" for="user-email">enter your email</label>
      <input
        v-model="loginInput"
        id="user-email"
        type="email"
        placeholder="Enter your email"
        required
      />

      <button id="login-submit--btn" type="submit">Login</button>
    </form>
  </div>

  <div v-if="!showLogin">{{ loginMessage }}</div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import NoteService from '../services/NoteService'

onMounted(() => {
  const token = localStorage.getItem('token')
  console.log(token)
})

const showLogin = ref(true)
const loginMessage = ref('')
const loginInput = ref()

async function login() {
  try {
    const loginResult = await NoteService.loginUser(loginInput.value)

    // console.log(loginResult)

    if (loginResult.status === 200) {
      showLogin.value = false
      loginMessage.value = loginResult.data.message
    }
  } catch (error) {
    console.log('Error message: ', error)
  }
}
</script>

<style scoped>
.visually-hidden {
  position: absolute;
  position: absolute !important;
  width: 1px !important;
  height: 1px !important;
  padding: 0 !important;
  margin: -1px !important;
  overflow: hidden !important;
  clip: rect(0, 0, 0, 0) !important;
  white-space: nowrap !important;
  border: 0 !important;
}
</style>
