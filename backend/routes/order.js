const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
const router = express.Router();

router.post('/total', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "SELECT  `name`, sum(item_amounts) as total, f_id, sum(item_amounts)*unit_price as `price`, unit_price FROM `order` join order_items using (order_id) join foods using (f_id) where order_date like ? group by f_id order by `total` desc",
            [req.body.month]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

router.get('/order/new', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "select max(order_id) as id from `order`"
        )

        return res.json(rows[0])
    }
    catch (err) {
        console.log(err)
    }
});

router.post('/additem/:order_id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "insert into order_items (unit_price, item_amounts, order_id, f_id) value(?, ?, ?, ?)",
            [req.body.unit_price, req.body.amount, req.params.order_id, req.body.f_id]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

router.post('/:cust_id/order/:rest_id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows0, fields0] = await pool.query(
            'insert into `order` (order_id, order_date, total_price, cust_id, rest_id) values (?, CURRENT_TIMESTAMP, ?, ?, ?)',
            [req.params.id, req.body.price, req.params.cust_id, req.params.rest_id]
        )

        return res.json(rows0)
    } catch (err) {
        return res.json(err)
    }
});



exports.router = router