<template>
  <button id="logout-btn" @click="logout">Logout</button>
  <div>
    <section class="logged-in-page">
      <h2>The logged in view, se create and edit docs here!</h2>

      <main class="main-container">
        <button class="create-btn" @click="createNewDocument = true" v-if="!createNewDocument">
          Create new document
        </button>
        <button class="closeTiny-btn" @click="createNewDocument = false" v-if="createNewDocument">
          Close Editor
        </button>
        <section class="action-container">
          <create-document v-if="createNewDocument" />
          <document-list />
        </section>
      </main>
    </section>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import NoteService from '../services/NoteService'
import { useDocsCollectionStore } from '../stores/docsCollection'
import DocumentList from '../components/documentList.vue'
import CreateDocument from './CreateDocument.vue'

const store = useDocsCollectionStore()
// const { docColletion } = storeToRefs(store)

const router = useRouter()

const createNewDocument = ref(false)

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
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100vh;
  width: 100vw;
  background-color: #f5f5f5;
}

.main-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  height: 100%;
  margin-block-start: 3rem;
}

.main-container > button {
  padding-inline: 5rem;
  padding-block: 2rem;
  border-radius: 1rem;
}

.create-btn {
  background-color: rgb(75, 196, 75);
  font-size: 1.5rem;
}

.closeTiny-btn {
  background-color: rgb(196, 75, 75);
  font-size: 1.5rem;
}

#logout-btn {
  position: absolute;
  top: 0;
  right: 0;
  margin: 1rem;
  padding: 0.5rem 1rem;
  background-color: #f5f5f5;
  border: none;
  border-radius: 0.5rem;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
}

.action-container {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  margin-block-start: 3rem;
}
</style>
