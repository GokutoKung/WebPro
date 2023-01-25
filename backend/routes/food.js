const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
const router = express.Router();

router.get('/foods', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "SELECT * FROM foods"
        )

        return res.json(rows)

    }
    catch (err) {
        console.log(err)
    }
});

exports.router = router