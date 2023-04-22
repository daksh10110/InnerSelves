const MainUser = require("./MainUser")
const Personality = require("./Personality")

MainUser.hasMany(Personality)
Personality.belongsTo(MainUser)

MainUser.sync()
Personality.sync()

module.exports = {
	MainUser,
	Personality
}