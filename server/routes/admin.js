const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Workout = require("../models/workout");

// Add workout
adminRouter.post("/admin/add-workout", admin, async (req, res) => {
  try {
    const { name, description, images } = req.body;
    let workout = new Workout({
      name,
      description,
      images,
    });
    workout = await workout.save();
    res.json(workout);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
