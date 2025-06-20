const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const EntryOrder = sequelize.define('EntryOrder', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_departure: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  fecha_ingreso: {
    type: Sequelize.DATE,
    allowNull: true
  },
  nombre_tecnico_proveedor: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  tecnico_recepcion: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  firma_proveedor: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  firma_tecnico: {
    type: Sequelize.TEXT,
    allowNull: true
  }
});
module.exports = EntryOrder;