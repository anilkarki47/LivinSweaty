const express = require('express');
const waterIntakeRouter = express.Router();

// Add progress
progressRouter.post("/auth/add-progress", auth, async (req, res) => {
    try {
      const { images } = req.body;
      let progress = new Progress({
          images
      });
      progress = await progress.save();
      res.json(progress);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  module.exports = progressRouter;

//   add water intake details
waterIntakeRouter.post('auth/api/add-waterIntake'), auth, async (req, res) =>{
    try{
        // const {}
    }catch(e){
        res.status(500).json({ error: e.message });
    }
}