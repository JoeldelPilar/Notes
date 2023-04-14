
const express = require('express');
const connection = require('../conn');
const jwt = require('jsonwebtoken');
const router = express.Router();

const { sendMagicLinkEmail } = require('../mailer');

// User login

router.post('/', function (req, res) {
  console.log(req.body);
  // const userName = connection.escape(req.body.userName);
  // const pw = connection.escape(req.body.password);
  const userEmail = req.body.userEmail


  connection.connect((err) => {
    if (err) {
      console.log('error: ', err)
    }

    // const sql = `SELECT uuid FROM users WHERE userName = ${userName} AND userPassword = ${pw}`
    const sql = `SELECT userEmail, uuid FROM users WHERE userEmail = "${userEmail}"`

    connection.query(sql, async (err, data) => {
      if (err) {
        console.log('error: ', err.message);
      }
      // Check if db response is []
      else if (data.length === 0) {
        res.status(202).json('Check your email inbox to finish logging in.');
        return;
      }
      if (data[0].userEmail === userEmail) {
        console.log('Success')
        const user = data[0];

        try {
          const token = jwt.sign({ userId: user.uuid }, process.env.JWT_SECRET_KEY, {
            expiresIn: '1h',
          });
          await sendMagicLinkEmail({ email: user.userEmail, token });
          res.json({ message: 'Check your email inbox to finish logging in.', token: token })
        } catch (error) {
          return res.status(401).send('Login failed, please try again' + error.message);
        }

      }

    });

  });

});

router.post('/verification', (req, res) => {
  const token = req.body.token
  console.log(token)
  if (token == null) {
    return res.status(401);
  }

  try {
    const decryptedToken = jwt.verify(token, process.env.JWT_SECRET_KEY);
    console.log(decryptedToken)

    const sql = `SELECT userName, uuid FROM users WHERE uuid = "${decryptedToken.userId}" AND deleted = "false"`

    connection.query(sql, (err, data) => {
      if (err) {
        console.error('error: ', err);
      }
      res.json(data)
    });

  } catch (error) {
    res.status(401).json(error);
  }

});

module.exports = router;
