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
    required: false,
  },
});

const Water = mongoose.model("Water", waterIntakeSchema);
module.exports = Water;
