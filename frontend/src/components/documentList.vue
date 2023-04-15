<template>
  <section class="document-list">
    <h2>Document list</h2>
    <div v-for="doc in docList" :key="doc.id" class="doc" @click="openClickedDocument(doc)">
      <p>{{ doc.doc.title }}</p>
    </div>

    <teleport to="body">
      <div class="modal" v-if="modalVisible">
        <modal-document :title="title" :body="body" :author="author" />
        <div class="action-container">
          <button @click="modalVisible = false">Close</button>
          <button @click="editDocument">Edit</button>
        </div>
      </div>
      <div class="modal" v-if="editDocumentVisible">
        <edit-document-modal />
        <div class="action-container">
          <button @click="editDocumentVisible = false">Close</button>
          <button @click="saveEditedDocument">Save</button>
        </div>
      </div>
    </teleport>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { storeToRefs } from 'pinia'
import { useDocsCollectionStore } from '../stores/docsCollection'
import { useEditDocStore } from '../stores/editDoc'
import NoteService from '../services/NoteService'
import ModalDocument from './ModalDocument.vue'
import editDocumentModal from './EditDocumentModal.vue'

const editStore = useEditDocStore()
const store = useDocsCollectionStore()
const { docList } = storeToRefs(store)
console.log(docList)

const editDocumentVisible = ref(false)
const modalVisible = ref(false)
const title = ref('')
const body = ref('')
const author = ref('')
const id = ref()

function openClickedDocument(doc) {
  console.log(
    `Clicked on document "${doc.doc.title}" with id ${doc.id} and user was ${doc.doc.userName}`
  )
  title.value = doc.doc.title
  body.value = doc.doc.body
  author.value = doc.doc.userName
  id.value = doc.doc.id
  modalVisible.value = true
}

function editDocument() {
  const edit = {
    title: title.value,
    body: body.value,
    author: author.value,
    id: id.value
  }

  editStore.editDoc = edit
  modalVisible.value = false
  editDocumentVisible.value = true
}

async function saveEditedDocument() {
  const updatedText = editStore.editDoc.body
  const id = editStore.editDoc.id

  const updateToDatabase = {
    text: updatedText,
    id: id
  }

  const updateSaved = await NoteService.updateDocument(updateToDatabase, id)
  console.log(updateSaved)
  editDocumentVisible.value = false

  store.docList = []

  const docs = await NoteService.getDocuments()
  console.log(docs)
  docs.data.map((doc) => {
    store.addDoc(doc)
  })
}
</script>

<style scoped>
.document-list {
  position: relative;
  cursor: pointer;
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
  width: 70vw;
}

.action-container {
  display: flex;
  justify-content: flex-end;
  margin-top: 1rem;
  gap: 1rem;
}

.action-container > button {
  padding-inline: 1rem;
}
</style>
