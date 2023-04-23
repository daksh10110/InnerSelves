const { Model, DataTypes } = require("sequelize")
const { sequelize } = require("../utils/db")

class Instruction extends Model {}
Instruction.init({
	id: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	instruction: {
		type: DataTypes.TEXT,
		allowNull: true
	},
	voiceNote: {
		type: DataTypes.TEXT,
		allowNull: true
	},
	time: {
		type: DataTypes.DATE,
		allowNull: false
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "Instruction"
})

module.exports = Instruction