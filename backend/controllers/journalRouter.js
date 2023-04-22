const express = require("express")
const journalRouter = express()
const { Personality, Journal } = require("../models/index")
const { update } = require("../models/MainUser")

journalRouter.get("/:id", async(req, res) => {
	const personality = await Personality.findOne({
		where: { id: req.params.id },
		include: { model: Journal }
	})

	res.json(personality.Journals)
})

journalRouter.post("/:id", async(req, res) => {
	const now = new Date()
	const newJournal = await Journal.create({
		title: req.body.title,
		description: req.body.description,
		date: now,
		PersonalityId: req.params.id
	})

	res.json(newJournal)
})

journalRouter.put("/:id1/:id2", async(req, res) => {
	const updatedData = req.body
	Journal.update(updatedData, { where: { id: req.params.id2 } })
	res.json(updatedData)
})

module.exports = journalRouter