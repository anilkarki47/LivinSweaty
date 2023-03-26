const express = require("express");
const mealRouter = express.Router();
const auth = require("../middlewares/auth");
const Meal = require("../models/meal");

// get all the meals
mealRouter.get("/api/meals", auth, async (req, res) => {
  try {
    const meals = await Meal.find({ category: req.query.category });
    res.json(meals);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});




module.exports = mealRouter;
