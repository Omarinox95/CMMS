const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const SparepartsWO = sequelize.define('SparepartsWO', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_workorder: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  nombre_repuesto: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  codigo_fabrica: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  cantidad: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  costo: {
    type: Sequelize.DECIMAL(10, 2),
    allowNull: true
  }
}); module.exports = SparepartsWO;