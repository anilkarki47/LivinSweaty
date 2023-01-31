const mongoose = require("mongoose");
const authRouter = require("../routes/auth");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: "string",
    trim: true,
  },
  email: {
    required: true,
    type: "string",
    trim: true,
    validate: {
      validator: (value) => {
        const regex =
          /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        return value.match(regex);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: "string",
  },
  type: {
    type: "string",
    default: "user",
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
