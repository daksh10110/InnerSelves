const Sequelize = require("sequelize")
const config = require("./config")

const sequelize = new Sequelize(config.DATABASE_URL, {
	dialectOptions: {},
})

module.exports = { sequelize }

