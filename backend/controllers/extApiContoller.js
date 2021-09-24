const axios = require("axios");

exports.getAllCategory = async (req, res) => {

    try {

        const categoryList = await axios.default.get("http://themealdb.com/api/json/v1/1/list.php?c=list");
        res.status(200).json(categoryList.data);

    } catch (err) {
        res.json({ error: "error" });
    }
}

exports.getAllArea = async (req, res) => {

    try {

        const areaList = await axios.default.get("http://themealdb.com/api/json/v1/1/list.php?a=area");
        res.status(200).json(areaList.data);

    } catch (err) {
        res.json({ error: "error" });
    }

}

exports.getAllQuery = async (req, res) => {

    try {

        const queryList = await axios.default.get(`http://themealdb.com/api/json/v1/1/filter.php?${Object.keys(req.query)[0]}=${Object.values(req.query)[0]}`);
        res.status(200).json(queryList.data);

    } catch (err) {
        res.send({ error: "error" });
    }

}

const filterIngredients = (meals) => {
    const ingredients = [];

    //api has fixed amount of ingredients 
    for (let i = 1; i <= 20; i++) {
        if (meals[`strIngredient${i}`]) {
            ingredients.push(meals[`strIngredient${i}`]);
        }
    }

    return ingredients;

}

exports.getById = async (req, res) => {

    try {
        const details = await axios.default.get(`http://themealdb.com/api/json/v1/1/lookup.php?i=${req.query.i}`);

        const meals = details.data.meals[0];

        const ingredients = filterIngredients(meals);   //microservice 

        res.status(200).json({
            image: meals.strMealThumb,
            name: meals.strMeal,
            category: meals.strCategory,
            area: meals.strArea,
            tags: meals.strTags,
            ingredients

        })

    } catch (err) {
        res.send({ error: "error" });
    }

}