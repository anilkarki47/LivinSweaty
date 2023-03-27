const mongoose = require("mongoose");
const PlaylistSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  workout: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Workout",
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model("Playlist", PlaylistSchema);
