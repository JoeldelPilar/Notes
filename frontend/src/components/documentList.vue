<template>
  <section class="document-list">
    <div v-for="doc in docList" :key="doc.id" class="doc" @click="openClickedDocument(doc)">
      <h3>{{ doc.doc.title }}</h3>
    </div>

    <teleport to="body">
      <div class="modal" v-if="modalVisible">
        <modal-document :title="title" :body="body" :author="author" />
        <button @click="modalVisible = false">Close</button>
        <button @click="editDocument">Edit</button>
      </div>
    </teleport>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { storeToRefs } from 'pinia'
import { useDocsCollectionStore } from '../stores/docsCollection'
import ModalDocument from './ModalDocument.vue'
import { useEditDocStore } from '../stores/editDoc'

const editStore = useEditDocStore()
const store = useDocsCollectionStore()
const { docList } = storeToRefs(store)
console.log(docList)

const modalVisible = ref(false)
const title = ref('')
const body = ref('')
const author = ref('')

function openClickedDocument(doc) {
  console.log(
    `Clicked on document "${doc.doc.title}" with id ${doc.id} and user was ${doc.doc.userName}`
  )
  title.value = doc.doc.title
  body.value = doc.doc.body
  author.value = doc.doc.userName
  modalVisible.value = true
}

function editDocument() {
  const edit = {
    title: title.value,
    body: body.value,
    author: author.value
  }

  editStore.editDoc = edit
  modalVisible.value = false
  console.log(edit)
}
</script>

<style scoped>
.document-list {
  position: relative;
}

.modal {
  position: absolute;
  top: 0;
  left: 0;
  background-color: hsla(0, 0%, 0%, 0.322);
  width: 100%;
  height: 100%;
  z-index: 10;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.modal > article {
  background-color: white;
  padding: 2.5rem;
  border-radius: 1rem;
  border: 1rem solid #242424;
  width: 23rem;
}
</style>
