const express = require("express")
const journalRouter = express()
const { MainUser, Personality } = require("../models/index")
const jwt = require("jsonwebtoken")

