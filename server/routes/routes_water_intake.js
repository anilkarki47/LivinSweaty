const express = require("express");
const Water = require("../models/water_intake");
const auth = require("../middlewares/auth");
const waterIntakeRouter = express.Router();
const cron = require("node-cron");

// add water intake details
waterIntakeRouter.post("/auth/add-waterIntake", auth, async (req, res) => {
  try {
    const { waterIntake } = req.body;
    const today = new Date();
    today.setHours(0, 0, 0, 0); // set hours to 0 to compare only date

    // check if there is an existing entry for the current date
    let water = await Water.findOne({
      userId: req.user,
      date: today,
    });

    if (!water) {
      // create a new entry with the water intake quantity
      water = await Water.create({
        userId: req.user,
        waterIntake,
        date: today,
      });
      return res.status(200).json({
        status: 200,
        message: "Water intake added successfully",
        water,
      });
    }

    // update the existing entry with the new water intake quantity
    water.waterIntake = waterIntake;
    const updatedWater = await water.save();
    return res.status(200).json({
      status: 200,
      message: "Water intake updated successfully",
      water: updatedWater,
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// waterIntakeRouter.post("/auth/add-waterIntake", auth, (req, res) => {
//   try {
//     const { waterIntake } = req.body;
//     Water.findOne({ userId: req.user })
//       .then((userWater) => {
//         if (!userWater) {
//           Water.create({
//             userId: req.user,
//             waterIntake,
//           })
//             .then((water) => {
//               if (!water)
//                 return res.status(200).json({
//                   status: 400,
//                   message: "water intake added failed",
//                   water,
//                 });
//               return res.status(200).json({
//                 status: 200,
//                 message: "water intake added successfully",
//                 water,
//               });
//             })
//             .catch((error) => {
//               res.status(500).json({
//                 error: error,
//                 status: 500,
//                 message: "something went wrong",
//               });
//             });
//         } else {
//           Water.findOneAndUpdate({ userId: req.user }, { waterIntake })
//             .then((water) => {
//               if (!water)
//                 return res.status(200).json({
//                   status: 400,
//                   message: "water intake added failed",
//                   water,
//                 });
//               return res.status(200).json({
//                 status: 200,
//                 message: "water intake added successfully",
//                 water,
//               });
//             })
//             .catch((error) => {
//               res.status(500).json({
//                 error: error,
//                 status: 500,
//                 message: "something went wrong",
//               });
//             });
//         }
//       })
//       .catch((error) => {
//         res
//           .status(500)
//           .json({ error: error, status: 500, message: "something went wrong" });
//       });
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// // Reset water intake value to 0 for all users every day

// cron.schedule("0 0 * * *", async () => {
//   try {
//     await Water.updateMany({}, { waterIntake: 0 });
//   } catch (error) {
//     console.error(error);
//   }
// });

// get water intake
waterIntakeRouter.get("/auth/get-waterIntake", auth, async (req, res) => {
  try {
    const water = await Water.find({});
    res.json(water);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = waterIntakeRouter;