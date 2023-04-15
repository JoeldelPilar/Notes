<template>
  <article class="tiny-container">
    <div class="tinymce">
      <label for="titleInput" class="visually-hidden">Enter document title here</label>
      <input v-model="title" id="titleInput" type="text" placeholder="Document title here..." />
      <Editor v-model="content" api-key="" ref="editorRef" :init="initConfig" id="tinyEditor" />
      <span class="errorMsg">{{ errorMsg }}</span>
    </div>

    <div class="button-container">
      <button class="actionBtn" @click="clearEditorContent">Clear</button>
      <button class="actionBtn" @click="saveEditorContent">Save</button>
    </div>
  </article>
</template>

<script setup>
import { ref } from 'vue'
// import { storeToRefs } from 'pinia'
import Editor from '@tinymce/tinymce-vue'
import NoteService from '../services/NoteService'
import { useDocsCollectionStore } from '../stores/docsCollection'
// import { useEditDocStore } from '../stores/editDoc'

// const editStore = useEditDocStore()
const store = useDocsCollectionStore()

// const { editDoc } = storeToRefs(editStore)

const title = ref('')
const content = ref('')
const errorMsg = ref('')

const initConfig = {
  height: 500,
  content_css: 'document',
  menubar: false,
  toolbar:
    'undo redo | styles | bold italic backcolor forecolor | \
    alignleft aligncenter alignright alignjustify | \
    bullist numlist outdent indent | removeformat | help',
  style_formats: [
    { title: 'Rubrik 1', format: 'h1' },
    { title: 'Rubrik 2', format: 'h2' },
    { title: 'Rubrik 3', format: 'h3' },
    { title: 'Stycke', format: 'p' },
    { title: 'Blockcitat', format: 'blockquote' },
    { title: 'Numrerad lista', format: 'ol' },
    { title: 'Punktlista', format: 'ul' }
  ]
}

function clearEditorContent() {
  content.value = ''
}

async function saveEditorContent() {
  const author = localStorage.getItem('token')

  console.log(content.value)

  const document = {
    title: title.value,
    body: content.value,
    author: author
  }

  if (content.value === '' || title.value === '') {
    errorMsg.value = 'Please enter a title and some content'
    return
  }

  await NoteService.saveDocument(document)

  store.docList = []
  title.value = ''
  content.value = ''

  const docs = await NoteService.getDocuments()

  console.log(docs)

  docs.data.map((doc) => {
    store.addDoc(doc)
  })
}
</script>

<style scoped>
.tinymce {
  padding: 2rem;
  border: 2px solid green;
  background-color: #242424;
}
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

#titleInput {
  padding: 0.25rem;
  margin-block-end: 1rem;
}

.actionBtn {
  padding-inline: 1rem;
  margin-inline: 0.5rem;
}

.button-container {
  margin-block-start: 1rem;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.button-container:first-child {
  background-color: rgb(221, 133, 133);
}

.tiny-container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.errorMsg {
  font-size: 1.5rem;
  font-weight: bold;
  color: red;
}
</style>
