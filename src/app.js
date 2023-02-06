const express = require("express");
const mysql = require("mysql2");

const app = express();

app.listen(3000, () => {
  console.log("Server listening on port 3000");
});

//database connection
const dbConnection = mysql.createConnection({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "asd123",
  database: "slutprojekt",
});

dbConnection.connect((err) => {
  if (err) {
    throw err;
  }
  console.log("Connection established.");
});

//Create MOVIE
app.get("/create", (request, response) => {
  let movieTitle = request.query.movie_title;
  let directorId = request.query.director_id;
  let movieRating = request.query.movie_rating;
  let releaseDate = request.query.release_date;

  let sql = `INSERT INTO movies VALUES (DEFAULT, '${movieTitle}', ${directorId}, ${movieRating}, '${releaseDate}');`;

  dbConnection.query(sql, (err, res) => {
    if (err) throw err;
    console.log(res);
    response.send(res);
  });
});
//READ MOVIES
app.get("/selectMovies", (request, response) => {
  let sql = "SELECT * FROM movies;";

  dbConnection.query(sql, (err, res) => {
    if (err) throw err;
    console.log(res);
    response.send(res);
  });
});
//READ GAMES
app.get("/select", (request, response) => {
  let sql = "SELECT * FROM games;";

  dbConnection.query(sql, (err, res) => {
    if (err) throw err;
    console.log(res);
    response.send(res);
  });
});
//UPDATE
app.get("/update", (request, response) => {
  let sql = "UPDATE games SET game_rating = 8 WHERE id = 1;";

  dbConnection.query(sql, (err, res) => {
    if (err) throw err;
    console.log(res);
    response.send(res);
  });
});
//DELETE
app.get("/delete", (request, response) => {
  let sql = "DELETE FROM publishers WHERE id = 1;";
  dbConnection.query(sql, (err, res) => {
    if (err) throw err;
    console.log(res);
    response.send(res);
  });
});
