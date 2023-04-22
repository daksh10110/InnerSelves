const MainUser = require("./MainUser")
const Personality = require("./Personality")
const Journal = require("./Journal")

MainUser.hasMany(Personality)
Personality.belongsTo(MainUser)

Personality.hasMany(Journal)
Journal.belongsTo(Personality)

MainUser.sync()
Personality.sync()
Journal.sync()

module.exports = {
	MainUser,
	Personality,
	Journal
}