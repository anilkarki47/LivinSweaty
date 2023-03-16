const express = require("express");
const auth = require("../middlewares/auth");
const Progress = require("../models/progress");
const progressRouter = express.Router();


// Add progress
progressRouter.post("/auth/add-progress", auth, async (req, res) => {
  try {
    const { images } = req.body;
    let progress = new Progress({
        images
    });
    progress = await progress.save();
    res.json(progress);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = progressRouter;