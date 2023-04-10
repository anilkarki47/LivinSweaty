const express = require("express");
const auth = require("../middlewares/auth");
const Playlist = require("../models/playlist.model");
const PlaylistName = require("../models/playlist_name");

const playlistRouter = express.Router();

// Add playlist
playlistRouter.post("/auth/add-playlist", auth, async (req, res) => {
  try {
    console.log(req.body);
    const { images } = req.body;
    let playlist = new Playlist({
      images,
    });
    //   playlist = await playlist.save();
    //   res.json(playlist);
  } catch (e) {
    res.status(500).json({ error: e.message });
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
