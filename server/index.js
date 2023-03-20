// PACKAGE IMPORTS
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILE
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const workoutRouter = require("./routes/routes_workout");
const progressRouter = require("./routes/routes_progress");
const mealRouter = require("./routes/routes_meal");

// INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://anil:anil123@cluster0.mdkt0tp.mongodb.net/?retryWrites=true&w=majority";

// MIDDLEWARE
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(workoutRouter);
app.use(progressRouter);
app.use(mealRouter);

// CONNECTIONS
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
