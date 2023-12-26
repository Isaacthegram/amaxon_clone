//import from packages
const express = require("express");
const mongoose = require('mongoose');
//import from other files
const authRouter = require("./routes/auth");
//import 'package:flutter/screens/auth.dart'


//initialize init
const PORT = 8000;
const app = express();
const DB = "mongodb+srv://jaydenanireh:sendokai@cluster0.eqhp5e0.mongodb.net/?retryWrites=true&w=majority"


//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose.connect(DB).then(() => {
console.log('Connection successful')
})
.catch((e) => {
console.log(e);
});

//creating an api

// GET, PUT, POST, DELETE, UPDATE [CRUD]
app.listen(PORT, "0.0.0.0", () => {
console.log(`connected at port ${PORT}`);
});
//localhost - if nothing is specified, the computer talks to itself
