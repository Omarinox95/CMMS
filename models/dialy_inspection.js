const Sequelize=require('sequelize');
const sequelize=require('../util/db.js');


const Daily_inspection=sequelize.define('DialyInspection',{
Code:{
    type:Sequelize.INTEGER,
    allowNull:false,
    autoIncrement:true,
    primaryKey:true
},
DATE:{
   type:Sequelize.STRING,
   allowNull:false 
},
Q1:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q2:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q3:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q4:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q5:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q6:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q7:{
    type:Sequelize.STRING,
    allowNull:false,
},
Q8:{
    type:Sequelize.STRING,
    allowNull:false,
}

});

Daily_inspection.associate = function (models) {
  Daily_inspection.belongsTo(models.Equipment, {
    foreignKey: 'EquipmentCode',
    targetKey: 'Code'
  });

  Daily_inspection.belongsTo(models.ClinicalEngineer, {
    foreignKey: 'ClinicalEnginnerDSSN',
    targetKey: 'DSSN'
  });
};
module.exports=Daily_inspection