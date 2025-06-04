// models/model.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js'); // asegúrate de que la ruta sea correcta

const Model = sequelize.define('model', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  Model: {
    type: Sequelize.STRING,
    allowNull: false
  },
  id_brand: {
    type: Sequelize.INTEGER,
    allowNull: true
  }
}, {
  timestamps: false,
  tableName: 'models'
});

module.exports = Model;
