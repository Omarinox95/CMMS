//añadido 03/03/25
// models/spare_part.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
const Category = require('./category'); // Asegúrate de que el path es correcto
const Brand = require('./brand');
//añadido 04/03/25
const Agent_supplier = require('./agent_supplier');  // Asegúrate de importar correctamente


const SparePart = sequelize.define('SparePart', {
    Id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,  // si aplica
    },
    Code: {
        type: Sequelize.STRING,
        allowNull: false
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
    CodeManufacter: {
    type: Sequelize.STRING,
    allowNull: false
    },
    CategoryId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
            model: 'Categories', // La tabla Categories en la base de datos
            key: 'IdCat' // Columna id de la tabla Categories
        }
    },
    id_brand: {
    type: Sequelize.INTEGER,
    allowNull: true,
    references: {
      model: 'brand',   // nombre exacto de la tabla brand
      key: 'id_brand'
    }
  }
});

// Relación entre SparePart y Category
SparePart.belongsTo(Category, { foreignKey: 'CategoryId' }); // SparePart pertenece a Category


SparePart.belongsTo(Agent_supplier, { foreignKey: 'AgentSupplierId' });  // Relación de SparePart a Agent_supplier

// Nueva relación a Brand
SparePart.belongsTo(Brand, { foreignKey: 'id_brand' });

module.exports = SparePart;
