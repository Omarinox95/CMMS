const Sequelize=require('sequelize');
const sequelize=require('../util/db.js');
//const { toDefaultValue } = require('sequelize/types/lib/utils.js');


const Work_order=sequelize.define('WorkOrder',{
Code:{
    type:Sequelize.INTEGER,
    allowNull:false,
    autoIncrement:true,
    primaryKey:true
},
StartDate:{
    type:Sequelize.TEXT,
    allowNull:false
},
EndDate:{
    type:Sequelize.TEXT,
    allowNull:false
},
Description:{
    type:Sequelize.TEXT,
    allowNull:false
},
Cost:{
    type:Sequelize.INTEGER,
    allowNull:false
},
Priority:{
    type:Sequelize.STRING,
    allowNull:false
},
Solution:{
    type:Sequelize.TEXT,
    allowNull:false
},
Workdate:{
    type:Sequelize.TEXT,
    //defaultValue: Sequelize.NOW,
    allowNull:false
},


})
module.exports=Work_order