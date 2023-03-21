const express = require("express");
const meditationRouter = express.Router();
const auth = require("../middlewares/auth");
const Meditation = require("../models/meditation");

// Post meditation
meditationRouter.post("/api/auth/add-meditation", async (req, res) => {
  try {
    const { name, artist, duration, link } = req.body;
    console.log(req.body);

    // Checking for empty request
    if (!name) {
      return res.status(400).json({
        error: "name is required",
        status: 404,
      });
    }
    if (!artist) {
      return res.status(400).json({
        error: "artist is required",
        status: 404,
      });
    }
    if (!duration) {
      return res.status(400).json({
        error: "duration is required",
        status: 404,
      });
    }
    if (!link) {
      return res.status(400).json({
        error: "link is required",
        status: 404,
      });
    }

    // Checkin for existing meditation
    const meditation = await Meditation.findOne({
      name,
    });
    if (meditation) {
      return res.status(400).json({
        error: "Meditation already exists",
        status: 409,
      });
    }

    // Creating new meditation
    const newMeditation = new Meditation({
      name,
      artist,
      duration,
      link,
    });
    await newMeditation.save();
    console.log(newMeditation);
    res.json({
      status: 201,
      newMeditation,
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get meditation
meditationRouter.get("/api/auth/get-meditation", async (req, res) => {
  try {
    const meditation = await Meditation.find();
    console.log(meditation);
    res.status(200).json(meditation);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = meditationRouter;
