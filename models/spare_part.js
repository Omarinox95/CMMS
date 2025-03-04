//añadido 03/03/25
// models/spare_part.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
const Category = require('./category'); // Asegúrate de que el path es correcto

//añadido 04/03/25
const Agent_supplier = require('./agent_supplier');  // Asegúrate de importar correctamente


const SparePart = sequelize.define('SparePart', {
    Code: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
    },
    Name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    Image: {
        type: Sequelize.STRING,
        allowNull: true
    },
    Amount: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    CategoryId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: 'Categories', // La tabla Categories en la base de datos
            key: 'id' // Columna id de la tabla Categories
        }
    }
});

// Relación entre SparePart y Category
SparePart.belongsTo(Category, { foreignKey: 'CategoryId' }); // SparePart pertenece a Category


SparePart.belongsTo(Agent_supplier, { foreignKey: 'AgentSupplierId' });  // Relación de SparePart a Agent_supplier


module.exports = SparePart;
