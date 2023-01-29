console.log("hello world");

const { json } = require("express");
const express = require("express");
const PORT = 3000;

const app = express();

// CREATING AN API
// GET, PUT, POST, DELETE, RPDATE -> CRUD

app.get("/", (req,res) => {
  res.json({name:"Anil Karki"});
});

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
