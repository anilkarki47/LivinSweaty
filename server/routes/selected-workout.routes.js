const auth = require("../middlewares/auth");
const router = require("express").Router();
const SelectedWorkout = require("../models/selected-workout.model");

// selectedWorkoutRouter.post("/auth/create-playlist", async (req, res) => {
//   const { workout, playlist } = req.body;
//   try {
//     let data = new SelectedWorkout({ workout, playlist });
//     data = await data.save();
//     if (!data)
//       return res
//         .status(200)
//         .json({ message: "Error creating playlist", status: 404 });
//     return res
//       .status(200)
//       .json({ message: "playlist created successfully", status: 200 });
//   } catch (error) {
//     return res
//       .status(500)
//       .json({ message: "something went wrong", status: 500 });
//   }
// });
// module.exports = selectedWorkoutRouter;

router.post("/add-selected-workout", async (req, res) => {
  try {
    const { workoutID, playlistID } = req.body;
    // console.log(req.body);

    if (!workoutID) {
      return res.status(400).json({ error: "workoutID is required" });
    }

    if (!playlistID) {
      return res.status(400).json({ error: "playlistID is required" });
    }

    const selectedWorkout = new SelectedWorkout({ workoutID, playlistID });
    await selectedWorkout.save();

    res.status(201).json({ selectedWorkout });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = router;
