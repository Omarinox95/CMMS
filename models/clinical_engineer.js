const Sequelize=require('sequelize');
const sequelize=require('../util/db.js');


const Clinical_engineer=sequelize.define('ClinicalEngineer',{
    DSSN: {
        type:Sequelize.BIGINT(20),
       allowNull:false,
       primaryKey:true
    },
   FName: {
    type:Sequelize.STRING,
    allowNull:false
    },
    LName:{
        type:Sequelize.STRING,
        allowNull:false
    },
    Phone:{
        type:Sequelize.BIGINT(20),
        allowNull:false,
    },
    Image:{
        type:Sequelize.STRING,
        allowNull:true
    },
    Age:{
        type:Sequelize.INTEGER,
        allowNull:false,
    },
    Email:{
        type:Sequelize.STRING,
        allowNull:false,    
    },
    Adress:{
     type:Sequelize.STRING,
     allowNull:false   
    },
    WorkHours:{
        type:Sequelize.INTEGER,
        allowNull:true
    },
    Password:{
        type:Sequelize.STRING,
        allowNull:false
    },
    role: {
        type: Sequelize.STRING,
        allowNull: false,
        defaultValue: 'clinicalEngineer'  // Por defecto
    }
}, {
    tableName: 'clinicalenginners', // 👈 nombre real de tu tabla en MySQL
    timestamps: true,               // 👈 ya que tienes createdAt y updatedAt
    freezeTableName: true  
});

module.exports=Clinical_engineer;