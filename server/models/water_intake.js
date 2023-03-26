const mongoose = require("mongoose");

const waterIntakeSchema=mongoose.Schema({
        userId: {
            type:String,
            required:true,
        },
        waterIntake: {
            type: Number,
            required: true,
        },
});
// just creating structure

module.exports = waterIntakeSchema;
