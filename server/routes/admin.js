const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Workout = require("../models/workout");
const Meal = require("../models/meal");
const auth = require("../middlewares/auth");

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

adminRouter.get("/auth/get-workouts", auth, async (req, res) => {
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
    const {
      name,
      prepTime,
      description,
      ingredients,
      instructions,
      category,
      images,
    } = req.body;
    let meal = new Meal({
      name,
      prepTime,
      description,
      ingredients,
      instructions,
      category,
      images,
    });
    meal = await meal.save();
    res.json(meal);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get all the meals
adminRouter.get("/admin/get-meal", admin, async (req, res) => {
  try {
    const meals = await Meal.find({});
    res.json(meals);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete the meals

adminRouter.post("/admin/delete-meal", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let meal = await Meal.findByIdAndDelete(id);
    res.json(meal);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = adminRouter;
