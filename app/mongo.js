const mongoose = require("mongoose");

const server = "127.0.0.1:27017";
const database = "andorigna";
class Database {
    constructor() {
        this._connect();
    }
    _connect() {
        mongoose
            .connect(`mongodb://${server}/${database}`)
            .then(() =>{
                console.log("Connection ok");
            })
            .catch((err) => {
                console.error("Error to connect", err)
            });
    }
} 

module.exports = new Database();
