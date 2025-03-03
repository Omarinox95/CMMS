// models/equipment.js
// models/equipment.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
//añadido 03/03/25 03:00 am
const SparePart = require('./spare_part'); // Asegúrate de que la ruta sea correcta
const EquipmentSparePart = require('./equipmentsparepart'); // Asegúrate de que la ruta sea correcta


const Equipment = sequelize.define('Equipment', {
  Code: {
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  Name: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  Image: {
    type: Sequelize.STRING,
    allowNull: true,
  },
  Cost: {
    type: Sequelize.BIGINT(12),
    allowNull: false,
  },
  Model: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  SerialNumber: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  InstallationDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  ArrivalDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  WarrantyDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  Manufacturer: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  Location: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  PM: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  Notes: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  DepartmentCode: { 
    type: Sequelize.INTEGER,
    allowNull: true,
  },
  //añadido 02/03/25
  Software: {
    type: Sequelize.TEXT,
    allowNull:false,
  },
  SoftwareVersion: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  SoftwarePass: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  NetworkAddress: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  AssetStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  InsuranceStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  FuntionalStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  //
});
// añadido 03/03/25Relación muchos a muchos entre `Equipment` y `SparePart` a través de `EquipmentSpareParts`
// Relación muchos a muchos con la tabla intermedia `equipmentsparepart`
// Especificamos el nombre de la tabla intermedia y las claves foráneas personalizadas
// Relación de uno a muchos con la tabla intermedia EquipmentSparePart
Equipment.hasMany(EquipmentSparePart, { foreignKey: 'id_equipment' });

// Relación de uno a muchos con SparePart a través de la tabla intermedia
//EquipmentSparePart.belongsTo(SparePart, { foreignKey: 'id_sparepart' });

//
module.exports = Equipment;
