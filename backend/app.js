const express = require("express");
const app = express();


app.get("/test", (req, res) => {
    res.send("lets go");
})

//external food api integration
const externalRoute = require("./routes/externalApi");
app.use("/api/json/v1", externalRoute);


module.exports = app;