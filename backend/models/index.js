const MainUser = require("./MainUser")
const Personality = require("./Personality")
const Journal = require("./Journal")
const PersonalityTask = require("./PersonalityTask")
const Task = require("./Task")
const Instruction = require("./Instruction")

MainUser.hasMany(Personality)
Personality.belongsTo(MainUser)

Personality.hasMany(Journal)
Journal.belongsTo(Personality)

Personality.hasMany(Instruction, { as: "sentInstructions", foreignKey: "senderId" })
Personality.hasMany(Instruction, { as: "receivedInstructions", foreignKey: "receiverId" })

Instruction.belongsTo(Personality, { as: "sender", foreignKey: "senderId" })
Instruction.belongsTo(Personality, { as: "receiver", foreignKey: "receiverId" })


Personality.belongsToMany(Task, { through: PersonalityTask });
Task.belongsToMany(Personality, { through: PersonalityTask });

MainUser.sync()
Personality.sync()
Journal.sync()
Instruction.sync()
PersonalityTask.sync()
Task.sync()

module.exports = {
	MainUser,
	Personality,
	Journal,
	Task,
	Instruction
}