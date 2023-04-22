const express = require("express")
const mainUserRouter = express()
const { MainUser } = require("../models/index")
const jwt = require("jsonwebtoken")

mainUserRouter.get("/me", async (req, res) => {
	const token = req.token
	const decodedToken = jwt.verify(token, process.env.SECRET)

	const mainUser = await MainUser.findByPk(decodedToken.id)
	res.json(mainUser)
})

module.exports = mainUserRouter