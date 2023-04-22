const express = require("express")
const personalityRouter = express()
const { MainUser, Personality } = require("../models/index")
const jwt = require("jsonwebtoken")

personalityRouter.get("/", async (req, res) => {
	const token = req.token
	const decodedToken = jwt.verify(token, process.env.SECRET)

	const user = await MainUser.findOne({
		where: { id: decodedToken.id },
		include: { model: Personality }
	})
	res.json(user.Personalities)
})

personalityRouter.post("/", async (req, res) => {
	const token = req.token
	const decodedToken = jwt.verify(token, process.env.SECRET)

	const newPersonality = await Personality.create({
		name: req.body.name,
		age: req.body.age,
		gender: req.body.gender,
		MainUserId: decodedToken.id
	})

	res.json(newPersonality)
})

module.exports = personalityRouter