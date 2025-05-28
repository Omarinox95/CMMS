const Sequelize = require('sequelize');
const sequelize = require('../util/db.js'); // verifica que esta ruta sea correcta

const Brand = sequelize.define('brand', {
  id_brand: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Brand: {
    type: Sequelize.STRING(50),
    allowNull: false,
  }
}, {
  timestamps: false,
  tableName: 'brand',
});

module.exports = Brand;
