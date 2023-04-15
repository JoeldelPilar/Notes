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

  <div class="login-msg" v-if="!showLogin">{{ loginMessage }}</div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import NoteService from '../services/NoteService'

onMounted(() => {
  // const token = localStorage.getItem('token')
})

const showLogin = ref(true)
const loginMessage = ref('')
const loginInput = ref()

async function login() {
  try {
    const loginResult = await NoteService.loginUser(loginInput.value)
    console.log(loginResult)
    if (loginResult.status === 200) {
      showLogin.value = false
      loginMessage.value = loginResult.data.message
    } else if (loginResult.status === 202) {
      showLogin.value = false
      loginMessage.value = loginResult.data
    }
  } catch (error) {
    console.log('Error message: ', 'Something went wrong when logging in, please try again.')
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

button {
  margin-inline-start: 1rem;
  padding-inline: 2.5rem;
  padding-block: 0.5rem;
  border: none;
  border-radius: 1rem;
  text-transform: uppercase;
  background-color: #6ccc6c;
  color: #222b23;
  font-weight: bold;
  letter-spacing: 0.1rem;
  box-shadow: 2px 2px 4px rgba(255, 250, 250, 0.233);
}

button:hover {
  cursor: pointer;
  transform: scale(1.1);
}

button:active {
  transform: scale(0.9);
}

#user-email {
  padding: 0.25rem;
}

.login-msg {
  margin-block-start: 1rem;
  font-size: 1.5rem;
  font-weight: bold;
  color: #6ccc6c;
}
</style>
