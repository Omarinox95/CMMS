/*const Sequelize=require('sequelize');
const sequelize=require('../util/db.js');


const Spare_part=sequelize.define('SparePart',{
Code:{
    type:Sequelize.INTEGER,
    allowNull:false,
    primaryKey:true
},
Name:{
    type:Sequelize.STRING,
    allowNull:false
},
Image:{
    type:Sequelize.STRING,
    allowNull:true
},

Amount:{
    type:Sequelize.INTEGER,
    allowNull:false
}


})
module.exports=Spare_part*/

//añadido 03/03/25
// models/spare_part.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
const Category = require('./category'); // Asegúrate de que el path es correcto
const EquipmentSparePart = require('./equipmentsparepart');

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

//añadido 03/03/25
// Relación de uno a muchos con la tabla intermedia EquipmentSparePart
SparePart.hasMany(EquipmentSparePart, { foreignKey: 'id_sparepart' });
//
module.exports = SparePart;
