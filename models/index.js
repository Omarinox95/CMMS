// models/index.js
const Equipment = require('./equipment');
const Department = require('./department');

//añadido 06/05
const AcquisitionType = require('./AcquisitionType');
const ReceptionStatus = require('./ReceptionStatus');

//añadido 11/05/25
const PreventiveTask = require('./preventiveTask');

//añadido 28/05
const NameEquipment = require('./nameequipment');
const Brand = require('./brand');
// Configurar la asociación entre Equipment y Department
Equipment.belongsTo(Department, {
  foreignKey: 'DepartmentCode',
  as: 'Department'
});
Department.hasMany(Equipment, {
  foreignKey: 'DepartmentCode',
  as: 'Equipments'
});

//añadido 11/05
PreventiveTask.belongsTo(Equipment, {
  foreignKey: 'EquipmentCode',
  as: 'equipmentTask',
});
//añadido 28/05
Equipment.belongsTo(NameEquipment, {
  foreignKey: 'NameEquipmentId',
  as: 'equipmentType'
});

NameEquipment.hasMany(Equipment, {
  foreignKey: 'NameEquipmentId',
  as: 'equipments'
});


module.exports = {
    //Ppm,
    Equipment,
    Department,
    AcquisitionType,
    ReceptionStatus,
    PreventiveTask,
    NameEquipment,
    Brand,
    //Clinical_enginner,
    //Ppm_questions,
};
