const mongooose = require("mongoose");

const MeditationSchema = mongooose.Schema({
  name: {
    required: true,
    type: "string",
    trim: true,
  },
  artist: {
    required: true,
    type: "string",
    trim: true,
  },
  duration: {
    required: true,
    type: "string",
    trim: true,
  },
  link: {
    required: true,
    type: "string",
    trim: true,
  },
});

const Meditation = mongooose.model("Meditation", MeditationSchema);
module.exports = Meditation;