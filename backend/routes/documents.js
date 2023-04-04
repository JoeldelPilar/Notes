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
                SELECT documents.title, documents.body, users.userName 
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

module.exports = router;