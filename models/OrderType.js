const Sequelize = require('sequelize');
const sequelize = require('../util/db');

const OrderType = sequelize.define('OrderType', {
  id_typeW: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Name: {
    type: Sequelize.STRING,
    allowNull: false,
    field: 'work'
  }
}, {
  tableName: 'ordertype',
  timestamps: false
});

module.exports = OrderType;
