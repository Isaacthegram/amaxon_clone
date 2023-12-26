const express = require('express');
const User = require("../models/user.js");
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

//signup
authRouter.post("/api/signup", async (req, res) => {

  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User with the same email already exists" });
    }
  
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User ({
      email,
      password: hashedPassword,
      name,
    })
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({error: e.message});

  }

  

});

// Define your routes and middleware here

authRouter.post('/api/signin', async (req, res) => {
  try {
    const {email, password} = req.body;

    const user = await User.findOne({email});

    if(!user) {
      return res
      .status(400)
      .json({msg: "User with this email does not exist!" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if(!isMatch) {
      return res
      .status(400)
      .json({msg: "Incorrect Password!" });
    }

    const token = jwt.sign({id: user._id}, "passwordKey");
    res.json({token, ...user._doc});
  } catch (e) {
    res.status(500).json({error: e.message});
  }
});

module.exports = authRouter;
