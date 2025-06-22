/*const Sequelize=require('sequelize');
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
    type:Sequelize.DECIMAL(15,2),
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
//añadido 04
 ClinicalEnginnerDSSN: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  EquipmentCode: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_typeW: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_StopReason: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_RepairStage: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_StopOrder: {
    type: Sequelize.INTEGER,
    allowNull: true
  },

})
module.exports=Work_order;

*/
const Sequelize = require('sequelize');
const sequelize = require('../util/db.js');

const WorkOrder = sequelize.define('WorkOrder', {
  Code: {
    type: Sequelize.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true
  },
  StartDate: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  EndDate: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  Description: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  Cost: {
    type: Sequelize.DECIMAL(15, 2),
    allowNull: true
  },
  Priority: {
    type: Sequelize.STRING,
    allowNull: false
  },
  Solution: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  Workdate: {
    type: Sequelize.TEXT,
    allowNull: true
  },

  // Foreign keys
  ClinicalEnginnerDSSN: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  EquipmentCode: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_typeW: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_StopReason: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_RepairStage: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  id_StopOrder: {
    type: Sequelize.INTEGER,
    allowNull: true
  },

  // Solicitante dinámico
  SolicitanteID: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  SolicitanteRole: {
    type: Sequelize.ENUM('MedicalStaff', 'ClinicalEngineer', 'Other'),
    allowNull: true
  },
  FirmaSolicitante: {
    type: Sequelize.TEXT,
    allowNull: true
  },

  // Departamento solicitante
  id_Department: {
    type: Sequelize.INTEGER,
    allowNull: true
  },

  // Reparación por proveedor
  id_AgentSupplier: {
    type: Sequelize.INTEGER,
    allowNull: true
  },
  NombreTecnicoProveedor: {
    type: Sequelize.STRING,
    allowNull: true
  },
  FirmaProveedor: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  NotasSalida: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  FechaSalida: {
    type: Sequelize.DATE,
    allowNull: true
  },
  FechaEntrada: {
    type: Sequelize.DATE,
    allowNull: true
  },

  // Entrega del equipo
  TecnicoEntrega: {
    type: Sequelize.BIGINT,
    allowNull: true
  },
  FirmaTecnicoEntrega: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  FechaEntregaArea: {
    type: Sequelize.DATE,
    allowNull: true
  },
  firma_personal: {
    type: Sequelize.TEXT,
    allowNull: true
  },
  observaciones_entrega: {
    type: Sequelize.TEXT,
    allowNull: true
  },

  // Costos adicionales
  costo_mano_obra: {
    type: Sequelize.DECIMAL(10, 2),
    allowNull: true
  },
  totalCost: {
    type: Sequelize.DECIMAL(15, 2),
    allowNull: true
  },
  date_work_end: {
    type: Sequelize.DATE,
    allowNull: true
  },
  FirmaTecnicoReparacion: {
  type: Sequelize.TEXT,
  allowNull: true
},

});

module.exports = WorkOrder;
