const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

// SIGN UP ROUTE
authRouter.post("/api/signup", async (req, res) => {
  try {
    // get the data from client
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exist!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }

  // post data in database

  // return data to the user
});

// LOGIN ROUTE
authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email: email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with the email doesn't exist!" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res
        .status(400)
        .json({ msg: "Incorrect password." });
    }
    // Token used to send request 
    const token = jwt.sign({id:user._id},"passwordKey");
    // object destructuring
    res.json({token, ...user._doc});
    
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
