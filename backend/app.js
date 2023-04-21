const config = require("./utils/config")
const express = require("express")
require("express-async-errors")
const bodyParser = require("body-parser")
const morgan = require("morgan")
const app = express()
const cors = require("cors")
const logger = require("./utils/logger")
const middleware = require("./utils/middleware")
const mongoose = require("mongoose")

const url = config.MONGODB_URI
logger.info("Connecting to MongoDB")

mongoose.connect((url, { useNewUrlParser: true, useUnifiedTopology: true }))
	.then(() => {
		logger.info("Connected to MongoDB")
	})
	.catch((error) => {
		logger.info(`Error Connecting to MongoDB ${error.message}`)
	})

morgan.token("ip", function(req) { return req.headers["x-forwarded-for"] || req.socket.remoteAddress })
// morgan.token('body', function (req) { return JSON.stringify(req.body) })
app.use(morgan(":ip :method :url :status :res[content-length] - :response-time ms"))

app.use(bodyParser.json())
app.use(cors())

app.use(middleware.errorHandler)