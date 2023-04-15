import axios from 'axios'

const apiClient = axios.create({
  baseURL: 'http://localhost:3000/api',
  withCredentials: false,
  headers: {
    Accept: 'application/json',
    'content-type': 'application/json'
  }
});

export default {
  loginUser(loginData) {
    return apiClient.post('/users', { userEmail: loginData });
  },

  loginSuccess(token) {
    return apiClient.post('/users/verification', { token: token })
  },

  getDocuments() {
    return apiClient.get('/documents')
  },

  saveDocument(document) {
    return apiClient.post('/documents', document)
  },

  updateDocument(update) {
    return apiClient.put('/documents', update)
  }
}