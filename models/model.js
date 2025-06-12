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
  },
  Q1: {
    type: Sequelize.STRING(500),
    allowNull: false
  },
  Q2: {
    type: Sequelize.STRING(500),
    allowNull: false
  },
  Q3: {
    type: Sequelize.STRING(500),
    allowNull: false
  },
  Q4: {
    type: Sequelize.STRING(500),
    allowNull: false
  },
  Q5: {
    type: Sequelize.STRING(500),
    allowNull: false
  }
}, {
  timestamps: false,
  tableName: 'models'
});

module.exports = Model;
