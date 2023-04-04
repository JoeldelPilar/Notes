const express = require('express');
const connection = require('../conn');
const router = express.Router();

// User login

router.post('/', function (req, res) {

  const userName = connection.escape(req.body.userName);
  const pw = connection.escape(req.body.password);

  console.log(userName + ' ' + pw);

  connection.connect((err) => {
    if (err) {
      console.log('error: ', err)
    }

    const sql = `SELECT uuid FROM users WHERE userName = ${userName} AND userPassword = ${pw}`

    connection.query(sql, (err, data) => {
      if (err) {
        console.log('error: ', err);
      }
      // Check if db response is []
      else if (data.length === 0) {
        res.status(404).json('Username or Password is incorrect');
        return;
      }
      console.log('users in db: ', data);
      res.json(data)
    });

  });

});

module.exports = router;
