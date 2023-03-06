const mongoose = require("mongoose");

const workoutSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  count: {
    type: String,
    required: true,
    trim: true,
  },
  target: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  category: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
});

const Workout = mongoose.model("Workout", workoutSchema);
module.exports = Workout;
