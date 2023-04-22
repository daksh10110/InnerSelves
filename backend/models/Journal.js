const { Model, DataTypes } = require("sequelize")
const { sequelize } = require("../utils/db")

class Journal extends Model {}
Journal.init({
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
	},
	date: {
		type: DataTypes.DATE,
		allowNull: false
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "Journal"
})

module.exports = Journal