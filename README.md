# About NOTES

This project is a part of the course API development at Medieinstitutet, Stockholm, Sweden <br>
<br>
Inside the documentation directory you can find the first draw made in "mirro" where I tried to visualize <br>
the user flow of the app.

There is also a reflection.md file that is part of the assignment and atm its in Swedish only <br>
(Swedish is the course language so thats the main reason for that.)<br>
The reflection.md is mainly to point out "why" certain decisions were made during the process, <br>
if it was to solve a issue or if any issues appeared because of them and how it was solved.

## Get up and running

To get the app started for demo just follow the steps listed below. <br>
<br>
One note about TinyMCE warning, it shows upp if there is no api-key provided in the `Editor` tag <br>
that can be found inside the two components "CreateDocument.vue" and "EditDocumentModal.vue" inside <br>
`Frontend/src/components`.

## MySQL Database

This app requires the use of a MySQL database. During development I used MAMP to create and handle my database. <br>
With MAMP you can admin your database with "phpMyAdmin", a form of GUI. <br>
<br>
Inside the documentation directory/map there is a exported file of a sample MySQL database to get you started.

## Backend

For ease of use I recomend that you have nodemon installed on your system.

<b>cd into the map "backend"</b>

> `npm install`

<b>to connect to the database</b>

> `nodemon start`

Now you should get a success message saying: `Connected to the database with ID "ID to the database"`

## Frontend

<b>cd in to the map "frontend"</b>

> `npm install`

<b>then to run app in localhost</b>

> `npm run dev`

> ctrl + click the url link that is provided in the terminal.

## TECH STACK

- Git
- Github
- Mirro
- VS Code

### Frontend:

- Vue.js 3
- Pinia & vue router
- Vite
- TinyMCE for vue 3
- CSS 3
- prettier
- ESlint

### Backend

- Express
- Cors
- ENV
- SQL querys
- sendGrid
- JWT

### DB

- MySQL
- MAMP
- PHPmyAdmin GUI
