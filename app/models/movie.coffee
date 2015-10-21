mongoose = require("mongoose")
Schema = mongoose.Schema
movieSchema = new Schema(
  title: String
  releaseYear: "String"
  director: "String"
  genre: "String"
)
module.exports = mongoose.model("Movie", movieSchema)