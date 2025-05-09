const { DataTypes } = require('sequelize');
const sequelize = require('../util/db');

const ReceptionStatus = sequelize.define('ReceptionStatus', {
  Id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  Name: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  tableName: 'receptionstatus',
  timestamps: false
});

module.exports = ReceptionStatus;
