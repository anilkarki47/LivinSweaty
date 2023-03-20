const mongoose = require("mongoose");

const mealSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  prepTime: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  ingredients: {
    type: String,
    required: true,
    trim: true,
  },
  instructions: {
    type: String,
    required: true,
    trim: true,
  },
  category: {
    type: String,
    required: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
});

const Meal = mongoose.model("Meal", mealSchema);
module.exports = Meal;
