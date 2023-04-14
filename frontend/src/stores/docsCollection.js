import { defineStore } from "pinia";

export const useDocsCollectionStore = defineStore('docList', {
  state: () => ({
    docList: [],
    id: 0
  }),
  actions: {
    addDoc(doc) {
      this.docList.push({ doc, id: this.id++, })
    }
  }
})