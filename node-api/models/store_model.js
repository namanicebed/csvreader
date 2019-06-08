const {mongoose} = require("../db/mongoose");

var storeSchema = mongoose.Schema({
  country: {
    type: String,
    //reqired: true
  },
  licenseNumber: {
    type: String,
    //required: true
  },
  operationType: {
    type: String,
    //required: true
  },
  establishmentType: {
    type: String,
    //required: true
  },
  entityName: {
    type: String,
    //required: true
  },
  dbaName: {
    type: String,
    //required: true
  },
  streetNumber: {
    type: String,
    //required: true
  },
  streetName: {
    type: String,
    //required: true
  },
  addressLine2: {
    type: String
  },
  addressLine3: {
    type: String
  },
  city: {
    type: String,
    //reqired: true
  },
  state: {
    type: String,
    //reqired: true
  },
  zipCode: {
    type: String,
    //required: true
  },
  squareFootage: {
    type: String,
    //required: true
  }
});

var Store = mongoose.model("Stores", storeSchema);

module.exports = { Store };
