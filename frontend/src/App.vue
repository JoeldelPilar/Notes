<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { useLogginTokenStore } from '@/stores/logginToken'

const store = useLogginTokenStore()

const savedLogin = store.savedLogin
</script>

<template>
  <header>
    <nav>
      <RouterLink to="/"></RouterLink>
      <RouterLink v-if="savedLogin" to="/loggedin"></RouterLink>
    </nav>
  </header>
  <RouterView />
</template>

<style scoped></style>
