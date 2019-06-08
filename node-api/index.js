const app = require("express")();
const csv = require("fast-csv");
const fs = require("fs");

const { mongoose } = require("./db/mongoose");
const { Store } = require("./models/store_model");

const port = process.env.PORT || 3000;

app.get("/",(req,res)=>{
  res.send("Welcome To CSVREADER App");
})

app.get("/create", (req, res) => {
  fs.createReadStream("retail-food-stores.csv")
    .pipe(csv())
    .on("data", data => {
      const stores = new Store({
        country: data[0],
        licenseNumber: data[1],
        operationType: data[2],
        establishmentType: data[3],
        entityName: data[4],
        dbaName: data[5],
        streetNumber: data[6],
        streetName: data[7],
        addressLine2: data[8],
        addressLine3: data[9],
        city: data[10],
        state: data[11],
        zipCode: data[12],
        squareFootage: data[13]
      });
      stores.save();
    })
    .on("end", () => {
      console.log("csv file reading successful!!");
      res.send("Created the database");
    });
  
});

app.get("/stores", (req, res) => {
  Store.find().then(stores => {
    res.send({ stores });
    //console.log(stores);
  });
});

app.listen(port, () => {
  console.log(`Started on port ${port}`);
});
