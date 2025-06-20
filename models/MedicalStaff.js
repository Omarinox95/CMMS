const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const MedicalStaff = sequelize.define('MedicalStaff', {
  DSSN: {
    type: Sequelize.BIGINT,
    primaryKey: true,
    allowNull: false
  },
  FName: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  LName: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  Email: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  Password: {
    type: Sequelize.STRING(255),
    allowNull: true
  },
  role: {
    type: Sequelize.STRING(50),
    allowNull: false,
    defaultValue: 'medical' // Valor por defecto
  }
}); module.exports= MedicalStaff;