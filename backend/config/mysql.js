// Connection à MySql
const mysql = require("mysql")

// Fonction pour se connecter à PhpMyAdmin (base de données)
const database = mysql.createConnection({
    user: "root",
    host: "localhost",
    password: "",
    database: "p7_groupomania",
});
console.log("Connecter à MySql");

database.connect()

module.exports = database