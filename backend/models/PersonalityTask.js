const { Model, DataTypes } = require("sequelize")
const { sequelize } = require("../utils/db")

class PersonalityTask extends Model {}
PersonalityTask.init({
	id: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	is_private: {
		type: DataTypes.BOOLEAN,
		defaultValue: true
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "PersonalityTask"
})

module.exports = PersonalityTask