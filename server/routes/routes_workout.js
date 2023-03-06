const express = require("express");
const workoutRouter = express.Router();
const auth = require("../middlewares/auth");
const Workout = require("../models/workout");

// client's url eg
// /api/workout?category=Biceps ~> this tipe of url use "query"
// /api/workout:category=Biceps ~> this tipe of url use "params"

// get all the workouts
workoutRouter.get("/api/workouts", auth, async (req, res) => {
  try {
    // console.log(req.query.category);
    const workouts = await Workout.find({ category: req.query.category });
    res.json(workouts);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = workoutRouter;
