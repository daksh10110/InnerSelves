const express = require("express")
const taskRouter = express()
const { Task } = require("../models/index")

taskRouter.get("/", async(req, res) => {
	const publicTasks = await Task.findAll({
		where: { isPrivate: false }
	})

	res.json(publicTasks)
})

module.exports = taskRouter