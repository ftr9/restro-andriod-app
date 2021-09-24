const app = require("./app");

const PORT = 5001 || process.env.PORT;

app.listen(PORT, () => {
    console.log(`server started on port ${PORT}`);
})