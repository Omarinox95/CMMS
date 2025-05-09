// models/index.js
const Equipment = require('./equipment');
const Department = require('./department');

//añadido 06/05
const AcquisitionType = require('./AcquisitionType');
const ReceptionStatus = require('./ReceptionStatus');

// Configurar la asociación entre Equipment y Department
Equipment.belongsTo(Department, {
  foreignKey: 'DepartmentCode',
  as: 'Department'
});
Department.hasMany(Equipment, {
  foreignKey: 'DepartmentCode',
  as: 'Equipments'
});

// añadido 06/05/25
/*Equipment.belongsTo(ReceptionStatus, 
  { foreignKey: 'ReceptionStatusId' 

 });

Equipment.belongsTo(AcquisitionType, 
  { foreignKey: 'AcquisitionTypeId' 

  });
*/


module.exports = {
    //Ppm,
    Equipment,
    Department,
    AcquisitionType,
    ReceptionStatus,
    //Clinical_enginner,
    //Ppm_questions,
};
