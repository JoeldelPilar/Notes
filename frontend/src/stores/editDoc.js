import { defineStore } from "pinia";

export const useEditDocStore = defineStore('editDoc', {
  state: () => ({
    editDoc: {
      title: '',
      body: '',
      author: '',
      id: ''
    },
  }),
})