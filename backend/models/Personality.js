const { Model, DataTypes } = require("sequelize")
const { sequelize } = require("../utils/db")


class Personality extends Model {}
Personality.init({
	id: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	name: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	age: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	gender: {
		type: DataTypes.TEXT,
		allowNull: false
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "Personality"
})

module.exports = Personality