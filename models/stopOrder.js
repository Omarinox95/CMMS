const Sequelize = require('sequelize');
const sequelize = require('../util/db');

const StopOrder = sequelize.define('stopOrder', {
   id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    description: {
      type: Sequelize.STRING,
      allowNull: false
    },
    punctuation: {
      type: Sequelize.INTEGER,
      allowNull: false
    }
}, {
  tableName: 'stoporder',
  timestamps: false
});

module.exports = StopOrder;


