const express = require("express");
const router = express.Router();

const externalApiController = require("../controllers/extApiContoller");

router.get("/list/category", externalApiController.getAllCategory);
router.get("/list/area", externalApiController.getAllArea);
router.get("/filter", externalApiController.getAllQuery);
router.get("/lookup", externalApiController.getById);


module.exports = router;