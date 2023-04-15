const mysql = require('mysql2')

connection = mysql.createConnection({
  host: 'localhost',
  port: '3306',
  user: 'delpilarnotes',
  password: (process.env.DB_KEY),
  database: 'delpilarnotes'
});

connection.connect(function (err) {
  if (err) {
    console.error('Fel vid anslutning till databasen: ' + err.stack);
    return;
  }
  console.log('Connected to the database with ID ' + connection.threadId);
});


module.exports = connection;