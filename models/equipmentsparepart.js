// models/equipmentsparepart.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
const SparePart = require('./spare_part');
const Equipment = require('./equipment');
const Agent_supplier = require('./agent_supplier');

const EquipmentSparePart = sequelize.define('equipmentsparepart', {
  id_equipment: {
    type: Sequelize.INTEGER,
    references: {
      model: Equipment,
      key: 'Code',  // El campo de Equipment que estamos referenciando
    },
    primaryKey: true,
  },
  id_sparepart: {
    type: Sequelize.INTEGER,
    references: {
      model: SparePart,
      key: 'Id',  // El campo de SparePart que estamos referenciando
    },
    primaryKey: true,
  },
  quantity: {
    type: Sequelize.DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 1
  },}, {
  tableName: 'equipmentspareparts', // que es el nombre real de la tabla en DB
  timestamps: true,
});

Equipment.belongsToMany(SparePart, { through: EquipmentSparePart, foreignKey: 'id_equipment' });
SparePart.belongsToMany(Equipment, { through: EquipmentSparePart, foreignKey: 'id_sparepart' });
SparePart.belongsTo(Agent_supplier, { foreignKey: 'AgentSupplierId' });


module.exports = EquipmentSparePart;
