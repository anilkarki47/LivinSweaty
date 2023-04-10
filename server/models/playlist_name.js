const mongoose = require("mongoose");
var Schema = mongoose.Schema;

const playlistNameSchema = new mongoose.Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  name: {
    type: String,
    required: true,
    trim: true,
  },
});

const PlaylistName = mongoose.model("PlaylistName", playlistNameSchema);
module.exports = PlaylistName;
