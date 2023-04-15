<template>
  <article class="edit-document">
    <h2>Edit {{ store.editDoc.title }}</h2>
    <Editor
      v-model="content"
      api-key=""
      ref="editorRef"
      :init="initConfig"
      id="editEditor"
      @change="updateContent"
    />
  </article>
</template>

<script setup>
import Editor from '@tinymce/tinymce-vue'
// import NoteService from '../services/NoteService'
import { useEditDocStore } from '../stores/editDoc'
import { storeToRefs } from 'pinia'

const store = useEditDocStore()
const { editDoc } = storeToRefs(store)
const content = editDoc.value.body
const initConfig = {
  height: 500,
  content: editDoc.value.body,
  content_css: 'dark',
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

function updateContent(text) {
  console.log(text.level.content)
  editDoc.value.body = text.level.content
}
</script>

<style scoped></style>
