const Sequelize = require('sequelize');
const sequelize = require('../util/db');

const RepairStage = sequelize.define('RepairStage', {
  id_RepairStage: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'id_Stage'  // campo en la base de datos
  },
  Status: {
    type: Sequelize.STRING,
    allowNull: false,
    field: 'Status'
  },
  FuntionalStatus: {  // ojo con el typo, debe ser igual que en la tabla
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'FuntionalStatus'  // campo real con typo
  }
}, {
  tableName: 'repairstage',
  timestamps: false
});

module.exports = RepairStage;
