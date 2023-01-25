const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')

const router = express.Router();

router.get('/bill', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "SELECT * FROM bills join `order` using (order_id)"
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

router.get('/bill/cust/:cust_id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "SELECT * FROM bills join `order` using (order_id) join customers using (cust_id) where cust_id =?",
            [req.params.cust_id]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

router.get('/bill/:id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "select order_date, unit_price, item_amounts, item_no, `name`, total_price from `order` join order_items using (order_id) join foods using (f_id) where order_id = ?",
            [req.params.id]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

router.post('/bill/:id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "insert into bills (price, pay_method, order_id) values(?, ?, ?)",
            [req.body.price, req.body.paymethod, req.params.id]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

exports.router = router