// models/nameequipment.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const NameEquipment = sequelize.define('NameEquipment', {
  id_nameE: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  Name: {
    type: Sequelize.STRING,
    allowNull: true,
  },
  function: {
    type: Sequelize.INTEGER,
    allowNull: true,
  },
  aplication: {
    type: Sequelize.INTEGER,
    allowNull: true,
  },
}, {
  tableName: 'nameequipment',
  timestamps: false,
});

// Asociación
NameEquipment.associate = (models) => {
  NameEquipment.hasMany(models.Equipment, {
    foreignKey: 'NameEquipmentId',
    as: 'equipments',
  });
};

module.exports = NameEquipment;
