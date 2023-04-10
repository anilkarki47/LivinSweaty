const mongoose = require("mongoose");
const playlistSchema = mongoose.Schema({
  playlistID: {
    type: String,
    required: true,
    trim: true,
  },
  workoutID: {
    type: String,
    required: true,
    trim: true,
  },
});

const Playlist = mongoose.model("Playlist", playlistSchema);
module.exports = Playlist;
