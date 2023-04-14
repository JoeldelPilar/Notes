<template>
  <div class="logged-in-page">
    <section>
      <h2>The logged in view, se create and edit docs here!</h2>
      <create-document />
      <document-list />
      <button id="logout-btn" @click="logout">Logout</button>
    </section>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
// import { storeToRefs } from 'pinia'
import NoteService from '../services/NoteService'
import { useDocsCollectionStore } from '../stores/docsCollection'
import DocumentList from '../components/documentList.vue'
import CreateDocument from './CreateDocument.vue'

const store = useDocsCollectionStore()
// const { docColletion } = storeToRefs(store)

const router = useRouter()

function logout() {
  localStorage.removeItem('token')
  router.push('/')
}

onMounted(async () => {
  const docs = await NoteService.getDocuments()
  console.log(docs)
  docs.data.map((doc) => {
    store.addDoc(doc)
  })
})
</script>

<style scoped>
.logged-in-page {
  border: 2px solid red;
}
</style>
