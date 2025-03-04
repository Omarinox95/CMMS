// models/index.js
const Equipment = require('./equipment');
const Department = require('./department');



// Configurar la asociación entre Equipment y Department
Equipment.belongsTo(Department, {
  foreignKey: 'DepartmentCode',
  as: 'Department'
});
Department.hasMany(Equipment, {
  foreignKey: 'DepartmentCode',
  as: 'Equipments'
});


module.exports = {
    //Ppm,
    Equipment,
    Department,
    //Clinical_enginner,
    //Ppm_questions,
};
