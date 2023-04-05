<template>
  <div>
    <form class="login-form">
      <label class="visually-hidden" for="user-name">User name</label>
      <input id="user-name" type="text" placeholder="User name" />

      <label class="visually-hidden" for="user-name">Password</label>
      <input id="user-password" type="text" placeholder="password" />

      <button id="login-submit--btn" type="submit">Login</button>
    </form>
  </div>
</template>

<script setup></script>

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
