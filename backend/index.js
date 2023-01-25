const express = require("express")

const app = express();
const cors = require('cors')
const { logger } = require('./middlewares')
app.use(logger)
app.use(cors())

// Statics
app.use(express.static('static'))
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// routers
const foodRouter = require('./routes/food')
const userRouter = require('./routes/user')
const reservationRouter = require('./routes/reservation')
const billRouter = require('./routes/bill')
const orderRouter = require('./routes/order')
const tableRouter = require('./routes/table')
const profileRouter = require('./routes/profile')

app.use(foodRouter.router)
app.use(userRouter.router)
app.use(reservationRouter.router)
app.use(billRouter.router)
app.use(orderRouter.router)
app.use(tableRouter.router)
app.use(profileRouter.router)

app.listen(3000, () => {
  console.log(`Example app listening at http://localhost:3000`)
})