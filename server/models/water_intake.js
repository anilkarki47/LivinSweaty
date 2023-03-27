const mongoose = require("mongoose");
var Schema = mongoose.Schema;
const waterIntakeSchema = new mongoose.Schema({
  userId: {
    type: Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  waterIntake: {
    type: Number,
    required: true,
  },
  date: {
    type: Date,
    default: Date.now,
  },
});
// just creating structure
const Water = mongoose.model("Water", waterIntakeSchema);
module.exports = Water;
