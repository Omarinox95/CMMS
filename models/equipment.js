// models/equipment.js
// models/equipment.js
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');
//añadido 03/03/25 03:00 am


const Equipment = sequelize.define('Equipment', {
  Code: {
    type: Sequelize.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  Name: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  Image: {
    type: Sequelize.STRING,
    allowNull: true,
  },
  Cost: {
    type: Sequelize.DECIMAL(15, 2),
    allowNull: false
  },
  ModelId: {
    type: Sequelize.INTEGER,
    allowNull: false, // si siempre debe estar presente
    references: {
      model: 'models',
      key: 'id'
    }
  },
  SerialNumber: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  InstallationDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  ArrivalDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  WarrantyDate: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  Manufacturer: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  Location: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  
  Notes: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  DepartmentCode: { 
    type: Sequelize.INTEGER,
    allowNull: true,
  },
  //añadido 02/03/25
  Software: {
    type: Sequelize.TEXT,
    allowNull:false,
  },
  SoftwareVersion: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  SoftwarePass: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  NetworkAddress: {
    type: Sequelize.TEXT,
    allowNull: true,
  },
  AssetStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  InsuranceStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  FuntionalStatus: {
    type: Sequelize.TEXT,
    allowNull:true,
  },
  NameEquipmentId: {
    type: Sequelize.INTEGER,
    allowNull: true,
    references: {
      model: 'nameequipment',
      key: 'id_nameE'
    }
  },
  F_record: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
  Maintenance_Req: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
  ModelId: {
    type: Sequelize.INTEGER,
    allowNull: true,
    references: {
      model: 'models',
      key: 'id'
    }
  },

  //
});


//añadido 28/05
Equipment.associate = (models) => {
    Equipment.belongsTo(models.NameEquipment, {
      foreignKey: 'NameEquipmentId',
      as: 'equipmentType'
    });
  };
  //

module.exports = Equipment;
