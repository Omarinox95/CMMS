const Sequelize = require('sequelize');
const sequelize = require('../util/db');

const StopReason = sequelize.define('StopReason', {
  id_StopReason: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'id_Reason'
  },
  Reason: {
    type: Sequelize.STRING,
    allowNull: false,
    field: 'Description'
  },
  punctuation: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  tableName: 'stopreason',
  timestamps: false
});

module.exports = StopReason;
