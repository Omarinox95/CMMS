const { DataTypes } = require('sequelize');
const sequelize = require('../util/db');

const AcquisitionType = sequelize.define('AcquisitionType', {
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
  tableName: 'acquisitiontype',
  timestamps: false
});

module.exports = AcquisitionType;
