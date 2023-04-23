const express = require("express")
const instructionRouter = express()
const { Personality, Instruction } = require("../models/index")

instructionRouter.get("/sent/:id", async (req, res) => {
	const personality = await Personality.findByPk(req.params.id, {
		include: {
			model: Instruction, as: "sentInstructions", include: "receiver"
		}
	})

	res.json(personality.sentInstructions)
})

instructionRouter.get("/received/:id", async (req, res) => {
	const personality = await Personality.findByPk(req.params.id, {
		include: {
			model: Instruction, as: "receivedInstructions", include: "sender"
		}
	})

	res.json(personality.receivedInstructions)
})

instructionRouter.post("/", async (req, res) => {
	const now = new Date()
	const newInstruction = await Instruction.create({
		instruction: req.body.instruction,
		time: now,
		voiceNote: req.body.voiceNote,
		senderId: req.body.senderId,
		receiverId: req.body.receiverId
	})

	res.json(newInstruction)
})

module.exports = instructionRouter