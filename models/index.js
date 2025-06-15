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
const SparePart = require('./spare_part');
//añadido 2/6
const Model = require('./model');

//añadido 04
const WorkOrder = require('./work_order');
const OrderType = require('./OrderType');
const StopReason = require('./StopReason');
const RepairStage = require('./RepairStage');
const ClinicalEngineer = require('./clinical_engineer');
const Daily_inspection = require('./dialy_inspection');
const TagNotification = require('./tagnotification'); // o el nombre correcto del archivo del modelo


const StopOrder = require('./stopOrder');
StopOrder.hasMany(WorkOrder, { foreignKey: 'id_StopOrder', as: 'work_orders' });
WorkOrder.belongsTo(StopOrder, { foreignKey: 'id_StopOrder', as: 'stopOrder' });

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

//añadido 02/06
// Relación: una marca tiene muchos modelos
Brand.hasMany(Model, {
  foreignKey: 'id_brand',
  as: 'models'
});

// Relación: un modelo pertenece a una marca
Model.belongsTo(Brand, {
  foreignKey: 'id_brand',
  as: 'brand'
});
// Asociación Equipment -> Model
Equipment.belongsTo(Model, {
  foreignKey: 'ModelId',
  as: 'model'
});

Model.hasMany(Equipment, {
  foreignKey: 'ModelId',
  as: 'equipments'
});
// En index.js, también podrías agregar la relación por claridad:
SparePart.belongsTo(Brand, { foreignKey: 'id_brand' });
Brand.hasMany(SparePart, { foreignKey: 'id_brand' });

//añadido 04
// Asociaciones para WorkOrder
// asociaciones
WorkOrder.belongsTo(OrderType, { foreignKey: 'id_typeW' });
WorkOrder.belongsTo(StopReason, { foreignKey: 'id_StopReason' });
WorkOrder.belongsTo(RepairStage, { foreignKey: 'id_RepairStage' });

OrderType.hasMany(WorkOrder, { foreignKey: 'id_typeW' });
StopReason.hasMany(WorkOrder, { foreignKey: 'id_StopReason' });
RepairStage.hasMany(WorkOrder, { foreignKey: 'id_RepairStage' });

// Asociaciones de DialyInspection
Daily_inspection.belongsTo(Equipment, {
  foreignKey: 'EquipmentCode',
  targetKey: 'Code'
});


//const ClinicalEngineer = require('./clinical_enginner');
Daily_inspection.belongsTo(ClinicalEngineer, {
  foreignKey: 'ClinicalEnginnerDSSN',
  targetKey: 'DSSN'
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
    Model,
    WorkOrder,
    OrderType,
    StopReason,
    RepairStage,
    StopOrder,
    Daily_inspection,
    ClinicalEngineer,
    TagNotification,
    //Clinical_enginner,
    //Ppm_questions,
};
