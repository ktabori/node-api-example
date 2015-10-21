Movie = require("../models/movie")
express = require("express")


#configure routes
router = express.Router()
router.route("/movies").get((req, res) ->
  Movie.find (err, movies) ->
    res.send err  if err
    res.json movies
).post (req, res) ->
  movie = new Movie()
  movie.title = req.body.title;
  movie.save (err) ->
    res.send err  if err
    res.send message: "Movie Added", data: req.body


# save the movie
router.route("/movies/:id").put((req, res) ->
  Movie.findOne
    _id: req.params.id
  , (err, movie) ->
    res.send err  if err
    for prop of req.body
      movie[prop] = req.body[prop]
    movie.save (err) ->
      res.send err  if err
      res.json message: "Movie updated!"

).get((req, res) ->
  Movie.findOne
    _id: req.params.id
  , (err, movie) ->
    res.send err  if err
    res.json movie

).delete (req, res) ->
  Movie.remove
    _id: req.params.id
  , (err, movie) ->
    res.send err  if err
    res
    res.json message: "Successfully deleted"

module.exports = router