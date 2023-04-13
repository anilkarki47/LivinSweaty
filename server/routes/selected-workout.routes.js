const auth = require("../middlewares/auth");
const router = require("express").Router();
const SelectedWorkout = require("../models/selected-workout.model");
const PlaylistName = require("../models/playlist_name");

router.post("/add-selected-workout", auth, async (req, res) => {
  try {
    const { workoutID, playlistID } = req.body;
    // console.log(req.body);

    if (!workoutID) {
      return res.status(400).json({ error: "workoutID is required" });
    }

    if (!playlistID) {
      return res.status(400).json({ error: "playlistID is required" });
    }

    const selectedWorkout = new SelectedWorkout({
      workoutID,
      playlistID,
      user: req.user,
    });
    await selectedWorkout.save();

    res.status(201).json({ selectedWorkout });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

// router.get("/auth/get-playlists", async (req, res) => {
//   // 6405a48fdba9e6ac17ee9757
//   let data = await SelectedWorkout.find({
//     user: "6405a48fdba9e6ac17ee9757",
//   })
//     // .populate("workoutID", "name count")
//     .populate("workoutID")
//     .populate("user")
//     .populate("playlistID");

//   res.status(200).json({ data });
//   // })
//   // .catch((error) => {
//   //   res.status(500).json({ error: "Server error" });
//   // });
// });

// get all the user playlist
router.get("/auth/get-playlists", auth, async (req, res) => {
  try {
    const data = await SelectedWorkout.find({
      user: req.user,
    })
      .populate("workoutID")
      .populate("user")
      .populate("playlistID");

    res.status(200).json({ data });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
