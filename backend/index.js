const app = require("./app")
const http = require("http")
const config = require("./utils/config")
const logger = require("./utils/logger")
const { connectToDatabase } = require("./utils/db")

const server = http.createServer(app)

const start = async () => {
	await connectToDatabase()
	server.listen(config.PORT, () => {
		logger.info(`Server running on port ${config.PORT}`)
	})
}

start()