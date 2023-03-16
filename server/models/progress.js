const mongooose = require("mongoose");

const progressSchema = mongooose.Schema({
  images: [
    {
      type: String,
      required: true,
    },
  ],
});

const Progress = mongooose.model("Progress", progressSchema);
module.exports = Progress;
