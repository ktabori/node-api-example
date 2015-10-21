# Load Our Modules
express = require("express")
bodyParser = require("body-parser")
movies = require("./routes/movies")
mongoose = require("mongoose")
app = express()

#connect to our database
#Ideally you will obtain DB details from a config file
dbName = process.env.DB_NAME
connectionString = process.env.DB_ADDRESS
mongoose.connect connectionString
app.use bodyParser.json()
app.use bodyParser.urlencoded({extended: true})
app.use "/api", movies
module.exports = app

app.set "port", process.env.PORT or 3000
server = app.listen(app.get("port"), ->
  console.log "Express server listening on port " + server.address().port
)
