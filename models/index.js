// models/index.js
const Equipment = require('./equipment');
const Department = require('./department');
//const Clinical_enginner = require('./clinical_engineer');
//const Ppm = require('./ppm'); // Asegúrate de que el nombre coincida
//const Ppm_questions = require ('./ppm_questions');


// Configurar la asociación entre Equipment y Department
Equipment.belongsTo(Department, {
  foreignKey: 'DepartmentCode',
  as: 'Department'
});
Department.hasMany(Equipment, {
  foreignKey: 'DepartmentCode',
  as: 'Equipments'
});

//AÑADIDO 12/11/24 15:47
/*pm.belongsTo(Equipment,{
  foreignKey: 'EquipmentCode'
});

Equipment.hasMany(Ppm,
  {
    foreignKey: 'EquipmentCode'
  }
);

Ppm.belongsTo(Clinical_enginner, {
  foreignKey: 'EngineerCode'
});

Clinical_enginner.hasMany(Ppm, {
  foreignKey: 'EngineerCode'
});
*/
/*module.exports = {
  Equipment,
  Department
};*/

module.exports = {
    //Ppm,
    Equipment,
    Department,
    //Clinical_enginner,
    //Ppm_questions,
};
