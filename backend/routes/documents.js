const express = require('express');
const connection = require('../conn');
const router = express.Router();

// Fetch all documents in db

router.get('/', function (req, res) {

  connection.connect((err) => {
    if (err) {
      console.log('error: ', err)
    }

    const sql = `
                SELECT documents.id, documents.title, documents.body, users.userName 
                FROM documents
                JOIN users 
                ON documents.author = users.uuid
                `

    connection.query(sql, (err, data) => {
      if (err) {
        console.log('error: ', err);
      }
      console.log('Docs in db: ', data);
      res.json(data)
    });

  });

});

// Save document / Post to db

router.post('/', (req, res) => {

  const title = connection.escape(req.body.title);
  const body = connection.escape(req.body.body);
  const author = connection.escape(req.body.author); // logged in user uuid

  connection.connect((err) => {
    if (err) {
      console.log('error: ', err)
    }

    const sql = `INSERT INTO documents (title, body, author) VALUES (${title}, ${body}, ${author})`

    connection.query(sql, (err, data) => {
      if (err) {
        console.log('error: ', err);
      }
      console.log('Docs in db: ', data);
      res.json(data)
    });

  });

});

// Update document

router.put('/', (req, res) => {

  const updateToBody = connection.escape(req.body.text);
  const textId = connection.escape(req.body.id);

  connection.connect((err) => {
    if (err) {
      console.log('error: ', err);
    }

    const sql = `UPDATE documents SET body = ${updateToBody} WHERE id = ${textId}`

    connection.query(sql, (err, data) => {
      if (err) {
        console.log('error: ', err);
        res.status(500).json({ message: 'Error updating document' });
      } else {
        res.status(200).json({ message: 'Document updated' });
      }
    })

  });
});

module.exports = router;