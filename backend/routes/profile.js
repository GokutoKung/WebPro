const express = require("express");
const pool = require("../config");
const Joi = require("joi");
const bcrypt = require("bcrypt");
const { isLoggedIn } = require('../middlewares')
const router = express.Router();

const profileSchema = Joi.object({
    email: Joi.string().required().email(),
    phone: Joi.string()
        .required()
        .pattern(/0[0-9]{9}/),
    fname: Joi.string().required().max(150),
    lname: Joi.string().required().max(150),
});

const passwordValidator = (value, helpers) => {
    if (value.length < 8) {
      throw new Joi.ValidationError(
        "Password must contain at least 8 characters"
      );
    }
    if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
      throw new Joi.ValidationError("Password must be harder");
    }
    return value;
  };

const passwordSchema = Joi.object({
    password: Joi.string().required().custom(passwordValidator),
    confirm_password: Joi.string().required().valid(Joi.ref("password")),
});

router.put('/pass/:id', isLoggedIn, async function (req, res, next) {
    const password = await bcrypt.hash(req.body.password, 5);

    try {
        await passwordSchema.validateAsync(req.body, { abortEarly: false });
    } catch (err) {
        return res.status(400).send(err);
    }

    try {
        const [rows0, fields0] = await pool.query(
            'update users set password = ? where id = ?',
            [password, req.params.id]
        )
        return res.json(rows0)
    } catch (err) {
        return res.json(err)
    }
});

router.put('/:id/edit', isLoggedIn, async function (req, res, next) {
    try {
        await profileSchema.validateAsync(req.body, { abortEarly: false });
    } catch (err) {
        return res.status(400).send(err);
    }

    try {
        const [rows0, fields0] = await pool.query(
            'update users set first_name = ?, last_name = ?, email = ?, phone = ? where id = ?',
            [req.body.fname, req.body.lname, req.body.email, req.body.phone, req.params.id]
        )
        return res.json(rows0)
    } catch (err) {
        return res.json(err)
    }
});

router.put('/:id/cust', isLoggedIn, async function (req, res, next) {
    try {
        const [rows0, fields0] = await pool.query(
            'update customers set fname = ?, lname = ?, phone = ?, email = ? where cust_id = ? value(?, ?, ?,?, ?)',
            [req.body.fname, req.body.lname, req.body.phone, req.body.email, req.params.id]
        )
        return res.json(rows0)
    } catch (err) {
        return res.json(err)
    }
});

router.put('/:id/emp', isLoggedIn, async function (req, res, next) {
    try {
        const [rows0, fields0] = await pool.query(
            'update employees set fname = ?, lname = ?, phone = ?, email = ? where emp_id = ? value(?, ?, ?,?, ?)',
            [req.body.fname, req.body.lname, req.body.phone, req.body.email, req.params.id]
        )
        return res.json(rows0)
    } catch (err) {
        return res.json(err)
    }
});

exports.router = router