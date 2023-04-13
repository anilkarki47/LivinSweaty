// const mongoose = require("mongoose");

// const SelectedWorkoutSchema = new mongoose.Schema(
//   {
//     workout: {
//       type: mongoose.Schema.Types.ObjectId,
//       ref: "Workout",
//       required: true,
//     },
//     playlist: {
//       type: mongoose.Schema.Types.ObjectId,
//       ref: "Playlist",
//       required: true,
//     },
//   },
//   {
//     timestamps: true,
//   }
// );

// module.exports = mongoose.model("SelectedWorkout", SelectedWorkoutSchema);

const mongoose = require("mongoose");

const selectedWorkoutSchema = new mongoose.Schema({
  workoutID: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Workout",
    required: true,
  },
  playlistID: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "PlaylistName",
    required: true,
  },
  date: {
    type: Date,
    default: Date.now,
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
});

const SelectedWorkout = mongoose.model(
  "SelectedWorkout",
  selectedWorkoutSchema
);
module.exports = SelectedWorkout;
