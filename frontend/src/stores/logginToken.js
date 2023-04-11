import { defineStore } from "pinia";

export const useLogginTokenStore = defineStore('logginToken', {
  state: () => ({
    loginToken: localStorage.getItem('token') || ''
  }),
  actions: {
    loginLogout(newValue) {
      localStorage.setItem('token', newValue)
    }
  }
})