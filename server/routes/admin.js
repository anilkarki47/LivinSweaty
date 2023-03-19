const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Workout = require("../models/workout");

// Add workout
adminRouter.post("/admin/add-workout", admin, async (req, res) => {
  try {
    const { name, count, target, description, category, images } = req.body;
    let workout = new Workout({
      name,
      count,
      target,
      description,
      category,
      images,
    });
    workout = await workout.save();
    res.json(workout);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get all the workouts

adminRouter.get("/admin/get-workouts", admin, async (req, res) => {
  try {
    const workouts = await Workout.find({});
    res.json(workouts);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the workouts

adminRouter.post("/admin/delete-workout", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let workout = await Workout.findByIdAndDelete(id);
    res.json(workout);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Add Meal
adminRouter.post("/admin/add-meal", admin, async (req, res) => {
  try {
    const { name, prepTime, ingredients, instructions, category, images } = req.body;
    let workout = new Workout({
      name,
      prepTime,
      description,
      ingredients,
      instructions,
      category,
      images,
    });
    workout = await workout.save();
    res.json(workout);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = adminRouter;
