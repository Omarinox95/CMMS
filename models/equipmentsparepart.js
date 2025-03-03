// models/equipmentsparepart.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const EquipmentSparePart = sequelize.define('equipmentsparepart', {
  id_equipment: {
    type: Sequelize.INTEGER,
    references: {
      model: 'Equipment',
      key: 'Code',  // El campo de Equipment que estamos referenciando
    },
    primaryKey: true,
  },
  id_sparepart: {
    type: Sequelize.INTEGER,
    references: {
      model: 'spareparts',
      key: 'Code',  // El campo de SparePart que estamos referenciando
    },
    primaryKey: true,
  },
});

module.exports = EquipmentSparePart;
