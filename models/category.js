// models/category.js
/*const Sequelize = require('sequelize');
const sequelize = require('../util/db.js'); // Asegúrate de que el path es correcto

const Category = sequelize.define('Category', {
    IdCat: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true // Hace que la ID se autoincremente
    },
    Name: {
        type: Sequelize.STRING,
        allowNull: false // No puede ser nulo
    }
});

module.exports = Category;*/
// models/category.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const Category = sequelize.define('Category', {
    IdCat: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true
    },
    Name: {
        type: Sequelize.STRING,
        allowNull: false
    }
}, {
    timestamps: false  // Desactivar los campos createdAt y updatedAt
});

module.exports = Category;
