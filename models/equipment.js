// models/equipment.js
// models/equipment.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
//añadido 03/03/25 03:00 am


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

module.exports = Equipment;
