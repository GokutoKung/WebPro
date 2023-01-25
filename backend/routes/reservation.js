const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
const router = express.Router();

router.post("/:cust_id/resv/:table_id", isLoggedIn, async function (req, res, next) {
    const id = req.params.cust_id;

    const conn = await pool.getConnection();
    await conn.beginTransaction();

    try {
        const [rows0, fields0] = await conn.query(
            "select * from `table` where table_id = ?",
            [req.params.table_id]
        );

        const [rows1, fields1] = await conn.query(
            "insert into reservations (booking_date, eating_date, cust_id, booked_seat) values (CURRENT_TIMESTAMP, ?, ?, ?)",
            [req.body.eating_date, req.params.cust_id, rows0[0].number_of_seat]
        );

        const [rows2, fields2] = await conn.query(
            "insert into reserv_data (resv_id, table_id) values (?, ?)",
            [rows1.insertId, req.params.table_id]
        );

        await conn.commit();
        return res.json(rows2[0]);
    } catch (err) {
        await conn.rollback();
        return res.json(err);
    } finally {
        conn.release();
    }
});

router.get("/rest", isLoggedIn, async function (req, res, next) {
    try {
        const [rows, fields] = await pool.query("select * from restaurants");
        return res.json(rows);
    } catch (err) {
        return res.json(err);
    }
});

router.get("/info/:rest_id", isLoggedIn, async function (req, res, next) {
    try {
        const [rows, fields] = await pool.query(
            "select * from restaurants where rest_id = ?",
            [req.params.rest_id]
        );
        return res.json(rows[0]);
    } catch (err) {
        return res.json(err);
    }
});

router.get("/info/seat/:table_id", isLoggedIn, async function (req, res, next) {
    try {
        const [rows, fields] = await pool.query(
            "select * from `table` where table_id = ?",
            [req.params.table_id]
        );
        return res.json(rows[0]);
    } catch (err) {
        return res.json(err);
    }
});

exports.router = router;
