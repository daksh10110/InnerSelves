const { Model, DataTypes } = require("sequelize")
const sequelize = require("../utils/db")


class MainUser extends Model {}
MainUser.init({
	id: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	legalName: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	legalAge: {
		type: DataTypes.INTEGER,
		allowNull: false
	},
	email: {
		type: DataTypes.TEXT,
		allowNull: false
	},
	passwordHash: {
		type: DataTypes.CHAR(60),
		allowNull: false
	},
	legalGender: {
		type: DataTypes.TEXT,
		allowNull: false
	}
}, {
	sequelize,
	underscrored: true,
	timestamps: false,
	modelName: "MainUser"
})

MainUser.sync()

module.exports = MainUser