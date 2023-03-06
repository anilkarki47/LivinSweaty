const mongooose = require("mongooose");

const progressSchema = mongooose.Schema({
  name: {
    type: "string",
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

const Progress = mongooose.model("Progress", progressSchema);
module.exports = Progress;
