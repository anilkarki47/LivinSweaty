const express = require("express");
const auth = require("../middlewares/auth");
const PlaylistName = require("../models/playlist_name");
const Play = require("../models/selected-workout.model");

const playlistRouter = express.Router();

// POST route to create a new playlist with workouts
playlistRouter.post("/create-playlist", auth, async (req, res) => {
  try {
    const { name, workouts } = req.body;

    if (!name) {
      return res.status(400).json({ message: "Playlist name is required." });
    }

    const newPlaylist = new Play({
      name,
      workouts,
    });

    await newPlaylist.save();

    res
      .status(201)
      .json({ message: "Playlist created successfully.", newPlaylist });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error." });
  }
});

// Add playlist name
playlistRouter.post("/auth/add-playlist-name", auth, async (req, res) => {
  try {
    // console.log(req.user);
    const { name } = req.body;
    let playlistName = new PlaylistName({ name, userId: req.user });
    playlistName = await playlistName.save();
    if (!playlistName)
      return res
        .status(200)
        .json({ message: "Error creating playlist", status: 404 });
    return res
      .status(200)
      .json({ message: "playlist created successfully", status: 200 });
  } catch (e) {
    res.status(500).json({ error: e.message, status: 500 });
  }
});

playlistRouter.post("/add-to-playlist", function (req, res) {});

// get playlist name
playlistRouter.get("/auth/get-playlist-name", async (req, res) => {
  try {
    const playlist = await PlaylistName.find();
    // console.log(playlist);
    res.status(200).json(playlist);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = playlistRouter;
