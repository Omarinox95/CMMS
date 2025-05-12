const Sequelize = require('sequelize');
const sequelize = require('../util/db'); // Asegúrate de que la ruta sea correcta

const PreventiveTask = sequelize.define('PreventiveTask', {
  id: {
    type: Sequelize.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  },
  EquipmentCode: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
  ScheduledDate: {
    type: Sequelize.DATEONLY, // Usamos DATEONLY para que sea solo la fecha (sin tiempo)
    allowNull: false,
  },
  Status: {
    type: Sequelize.STRING,
    defaultValue: 'Programada', // Valor por defecto
  },
  createdAt: {
    type: Sequelize.DATE,
    allowNull: false,
    defaultValue: Sequelize.NOW, // Valor por defecto con la fecha de creación
  },
  updatedAt: {
    type: Sequelize.DATE,
    allowNull: false,
    defaultValue: Sequelize.NOW, // Valor por defecto con la fecha de actualización
  },
});


module.exports = PreventiveTask;
