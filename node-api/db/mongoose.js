const mongoose = require("mongoose");

mongoose.Promise = global.Promise;
mongoose.connect(
  "mongodb://naman:22sanan198000@ds135107.mlab.com:35107/store" ,
    // "mongodb://localhost:27017/StoreData",
  {
    useNewUrlParser: true
  }
);

mongoose.set("useCreateIndex", true);
module.exports = { mongoose };
