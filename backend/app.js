const config = require("./utils/config")
const express = require("express")
require("express-async-errors")
const bodyParser = require("body-parser")
const app = express()
const cors = require("cors")
const logger = require("./utils/logger")
const middleware = require("./utils/middleware")
const morgan = require("morgan")
const mainUserRouter = require("./controllers/mainUserRouter")
const authRouter = require("./controllers/authRouter")
const personalityRouter = require("./controllers/personalityRouter")
const journalRouter = require("./controllers/journalRouter")
const instructionRouter = require("./controllers/instructionRouter")

const url = config.DATABASE_URL
logger.info("connecting to", url)


morgan.token("ip", function(req) { return req.headers["x-forwarded-for"] || req.socket.remoteAddress })
// morgan.token('body', function (req) { return JSON.stringify(req.body) })
app.use(morgan("---:ip :method :url :status :res[content-length] - :response-time ms---"))

app.use(bodyParser.json())
app.use(cors())

app.use("/api/auth", authRouter)

app.use(middleware.tokenExtractor)
app.use(middleware.tokenValidator)

app.use("/api/users", mainUserRouter)
app.use("/api/personalities", personalityRouter)
app.use("/api/journals", journalRouter)
app.use("/api/instructions", instructionRouter)

app.use(middleware.errorHandler)

module.exports = app
