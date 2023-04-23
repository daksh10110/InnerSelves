const { Model, DataTypes } = require("sequelize")
const { sequelize } = require("../utils/db")

class Task extends Model {}
Task.init({
	id: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	title: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	description: {
		type: DataTypes.TEXT,
		allowNull: true
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "Task"
})

module.exports = Task