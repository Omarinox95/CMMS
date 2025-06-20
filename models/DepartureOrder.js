const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

// Modelo departureOrder
const DepartureOrder = sequelize.define('DepartureOrder', {
  id_departure: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_workorder: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_agentsupplier: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  nombre_personal: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  id_tecnico_entrega: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  firma_personal: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  firma_tecnico: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  fecha_entrega: {
    type: Sequelize.DATE,
    allowNull: true
  },
  estado: {
    type: Sequelize.ENUM('abierta', 'cerrada'),
    allowNull: true
  }
});
module.exports=DepartureOrder;