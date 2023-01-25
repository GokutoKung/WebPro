const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
const router = express.Router();

router.get("/table/:rest_id", isLoggedIn, async function (req, res, next) {
    try {
        const [rows, fields] = await pool.query(
            "select * from `table` where rest_id = ?",
            [req.params.rest_id]
        );
        return res.json(rows);
    } catch (err) {
        return res.json(err);
    }
});

router.put('/status/:table_id', isLoggedIn, async function (req, res, next) {
    try {
        const [rows, field] = await pool.query(
            "update `table` set status = ? where table_id = ?",
            [req.body.status, req.params.table_id]
        )

        return res.json(rows)
    }
    catch (err) {
        console.log(err)
    }
});

exports.router = router