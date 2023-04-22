const jwt = require("jsonwebtoken")
const bcrypt = require("bcrypt")
const authRouter = require("express").Router()
const { MainUser } = require("../models/index")

authRouter.post("/signup", async(req, res) => {
	try {
		const body = req.body

		if (Object.keys(body).length === 0) {
			return res.status(400).json({
				error: "content missing"
			})
		}

		const saltRounds = 10
		const passwordHash = await bcrypt.hash(body.password, saltRounds)
		const mainUser = {
			"legalName": body.legalName,
			"legalAge": body.legalAge,
			"email": body.email,
			"passwordHash": passwordHash,
			"legalGender": body.legalGender
		}

		const savedMainUser = await MainUser.create(mainUser)
		res.json(savedMainUser)

	} catch (error) {
		return res.status(400).json({ error })
	}
})

authRouter.post("/login", async(req, res) => {
	try {
		const { email, password } = req.body
		const user = await MainUser.findOne({ where: { email: email } })

		const passwordCorrect = user === null
			? false
			: await bcrypt.compare(password, user.passwordHash)

		if (!(user && passwordCorrect)) {
			return res.status(401).json({
				error: "invalid password or username"
			})
		}

		const userForToken = {
			id: user.id
		}

		const token = jwt.sign(userForToken, process.env.SECRET)

		res
			.status(200)
			.send(token)

	} catch (err) {
		console.log(err)
		res.send(500).send("Internal Server Error")
	}
})

module.exports = authRouter