const MainUser = require("./MainUser")
const Personality = require("./Personality")
const Journal = require("./Journal")
const Instruction = require("./Instruction")

MainUser.hasMany(Personality)
Personality.belongsTo(MainUser)

Personality.hasMany(Journal)
Journal.belongsTo(Personality)

Personality.hasMany(Instruction, { as: "sentInstructions", foreignKey: "senderId" })
Personality.hasMany(Instruction, { as: "receivedInstructions", foreignKey: "receiverId" })

Instruction.belongsTo(Personality, { as: "sender", foreignKey: "senderId" })
Instruction.belongsTo(Personality, { as: "receiver", foreignKey: "receiverId" })

MainUser.sync()
Personality.sync()
Journal.sync()
Instruction.sync()

module.exports = {
	MainUser,
	Personality,
	Journal,
	Instruction
}