const Sequelize=require('sequelize');
const sequelize=require('../util/db.js');

const TagNotification=sequelize.define('tagnotification', {
    id_tagn: {
        type:Sequelize.INTEGER,
        allowNull:false,
        autoIncrement:true,
        primaryKey:true
    },
    user: {
        type:Sequelize.STRING,
        allowNull:false
    },
    message: {
        type:Sequelize.STRING,
        allowNull:false
    }
});

module.exports = TagNotification;
