const OrderType = require('../models/OrderType')
const Agent_supplier = require('../models/agent_supplier')
const { sparePart } = require('./home')

Equipment=require('../models/equipment')
AgentSupplier=require('../models/agent_supplier')
ClinicalEngineer=require('../models/clinical_engineer')
Department=require('../models/department')
SparePart=require('../models/spare_part')
DialyInspection=require('../models/dialy_inspection')
BreakDown=require('../models/break_down')
Maintenance=require('../models/maintenance')
PPM =require('../models/ppm')
PPMQuestions=require('../models/ppm_questions')
EquipmentSparePart = require('../models/equipmentsparepart');
Model = require('../models/model');
WorkOrder=require('../models/work_order');
StopOrder = require('../models/stopOrder');
//const { Equipment, SparePart, EquipmentSparePart, Agent_supplier } = require('../models');
const { Op } = require('sequelize');
StopReason = require('../models/StopReason');
const calcularHorasTotales = (fechaInicio, fechaFin) => {
  const diffEnHoras = Math.abs(new Date(fechaFin) - new Date(fechaInicio)) / (1000 * 60 * 60);
  return diffEnHoras;
};



exports.indicadoresPorEquipo = async (req, res) => {
  const code = req.params.code;

  try {
    const equipo = await Equipment.findOne({ where: { code } });

    if (!equipo) {
      return res.status(404).send('Equipo no encontrado');
    }
    
    const fallas = await BreakDown.findAll({ where: { EquipmentCode: code } });
    console.log('Cantidad de fallas encontradas:', fallas.length);
    let tiempoTotalReparacion = 0;

    for (const falla of fallas) {
      const mantenimiento = await Maintenance.findOne({ where: { BreakDownCode: falla.Code } });
      if (mantenimiento && mantenimiento.StartDate && mantenimiento.EndDate) {
        tiempoTotalReparacion += calcularHorasTotales(mantenimiento.StartDate, mantenimiento.EndDate);
      }
    }

    const numFallos = fallas.length;
    const fechaInicio = equipo.InstallationDate || new Date();
    const fechaFin = new Date();
    const horasTotalesOperacion = calcularHorasTotales(fechaInicio, fechaFin);

    const MTBF = numFallos > 0 ? (horasTotalesOperacion / numFallos).toFixed(2) : 'N/A';
    const MTTR = numFallos > 0 ? (tiempoTotalReparacion / numFallos).toFixed(2) : 'N/A';

    let disponibilidad = '100';
    if (numFallos > 0 && horasTotalesOperacion > 0) {
      disponibilidad = ((horasTotalesOperacion - tiempoTotalReparacion) / horasTotalesOperacion * 100).toFixed(2);
    } else if (horasTotalesOperacion === 0) {
      disponibilidad = 'N/A';
    }

    const confiabilidad = numFallos > 0
      ? (Math.exp(-1 / (horasTotalesOperacion / numFallos)) * 100).toFixed(2)
      : '100';

    const workOrders = await WorkOrder.findAll({ where: { EquipmentCode: code }, include:[{model: OrderType, attributes:['Name']}, { model: StopReason, attributes: ['Reason'] }] });
    const conteoTipoW = {};
    workOrders.forEach(wo => {
      const tipo = wo.OrderType ? wo.OrderType.Name : 'Desconocido';
      conteoTipoW[tipo] = (conteoTipoW[tipo] || 0) + 1;
    });

    let arregloTipoW = Object.entries(conteoTipoW)
      .map(([tipo, cantidad]) => ({ tipo, cantidad }));

    arregloTipoW.sort((a, b) => b.cantidad - a.cantidad);

    const totalWorkOrders = workOrders.length;
    let acumulado = 0;
    arregloTipoW = arregloTipoW.map(item => {
      acumulado += item.cantidad;
      return {
        ...item,
        porcentaje: ((item.cantidad / totalWorkOrders) * 100).toFixed(2),
        acumulado: ((acumulado / totalWorkOrders) * 100).toFixed(2)
      };
    });

    const conteoRazones = {};
workOrders.forEach(wo => {
  const razon = wo.StopReason ? wo.StopReason.Reason : 'Sin razón registrada';
  conteoRazones[razon] = (conteoRazones[razon] || 0) + 1;
});

let arregloRazones = Object.entries(conteoRazones)
  .map(([tipo, cantidad]) => ({ tipo, cantidad }));

arregloRazones.sort((a, b) => b.cantidad - a.cantidad);

const total = arregloRazones.reduce((sum, item) => sum + item.cantidad, 0);
let acumuladoRazones  = 0;
arregloRazones = arregloRazones.map(item => {
  acumuladoRazones  += item.cantidad;
  return {
    ...item,
    porcentaje: ((item.cantidad / total) * 100).toFixed(2),
    acumulado: ((acumuladoRazones  / total) * 100).toFixed(2)
  };
});

    // ================== NUEVO BLOQUE: Indicadores Mensuales ==================
       // Año actual para análisis
    const anioAnalisis = new Date().getFullYear();
    const mesActual = new Date().getMonth(); // Mes actual (0-based)

    const indicadoresMensuales = {};
console.log('Comenzando análisis mensual');
    for (let mes = 0; mes < 12; mes++) {
      if (mes > mesActual) {
        // Mes futuro: no calculamos, asignamos null o 0 para evitar problemas en frontend
        indicadoresMensuales[mes] = {
          mes,
          MTBF: null,
          MTTR: null,
          disponibilidad: null,
          confiabilidad: null
        };
      } else {
        // Mes válido, calculamos indicadores
        const fallasMes = fallas.filter(f => {
          if (!f.DATE) return false; // Ignorar fallas sin fecha
          const fecha = new Date(f.DATE);
          console.log('Fecha falla:', f.DATE, '=> JS Date:', fecha, 'Mes esperado:', mes, 'Mes de fecha:', fecha.getMonth());
          return fecha.getFullYear() === anioAnalisis && fecha.getMonth() === mes;
        });
console.log(`Fallos encontrados para mes ${mes}: ${fallasMes.length}`);
    let tiempoReparacionMes = 0;
    for (const falla of fallasMes) {
        const mantenimiento = await Maintenance.findOne({ where: { BreakDownCode: falla.Code } });
        if (mantenimiento?.StartDate && mantenimiento?.EndDate) {
        tiempoReparacionMes += calcularHorasTotales(mantenimiento.StartDate, mantenimiento.EndDate);
        }
    }

    const numFallosMes = fallasMes.length;

    // Número real de días del mes para calcular horas de operación
    const diasMes = new Date(anioAnalisis, mes + 1, 0).getDate();
    const horasOperacionMes = diasMes * 24;

    const MTBFmes = numFallosMes > 0 ? (horasOperacionMes / numFallosMes).toFixed(2) : 0;
    const MTTRmes = numFallosMes > 0 ? (tiempoReparacionMes / numFallosMes).toFixed(2) : 0;
    const disponibilidadMes = numFallosMes > 0 ? ((horasOperacionMes - tiempoReparacionMes) / horasOperacionMes * 100).toFixed(2) : 100;
    const confiabilidadMes = numFallosMes > 0 ? (Math.exp(-1 / (horasOperacionMes / numFallosMes)) * 100).toFixed(2) : 100;

    indicadoresMensuales[mes] = {
        mes,
        MTBF: parseFloat(MTBFmes),
        MTTR: parseFloat(MTTRmes),
        disponibilidad: parseFloat(disponibilidadMes),
        confiabilidad: parseFloat(confiabilidadMes)
    };
    }
  }
    // ========================================================================

    res.render('indicadores', {
        layout: 'equipmentReportLayout',
      equipo,
      name: equipo.Name,
      installationDate: equipo.InstallationDate,
      MTBF,
      MTTR,
      disponibilidad,
      confiabilidad,
      numFallos,
      tiempoTotalReparacion: tiempoTotalReparacion.toFixed(2),
      code,
      //indicadoresMensuales: JSON.stringify(Object.values(indicadoresMensuales))
      paretoData: arregloTipoW,
      paretoStopReasonData: arregloRazones, // el nuevo
      indicadoresMensuales: Object.values(indicadoresMensuales)
    });

  } catch (error) {
    console.error('Error al obtener indicadores:', error);
    res.status(500).send('Error interno del servidor');
  }
};

/*const calcularHorasTotales = (fechaInicio, fechaFin) => {
  const diffEnHoras = Math.abs(new Date(fechaFin) - new Date(fechaInicio)) / (1000 * 60 * 60);
  return diffEnHoras;
};

exports.indicadoresPorEquipo = async (req, res) => {
  const code = req.params.code;

  try {
    const equipo = await Equipment.findOne({ where: { code } });

    if (!equipo) return res.status(404).send('Equipo no encontrado');

    const fallas = await BreakDown.findAll({ where: { EquipmentCode: code } });
    let tiempoTotalReparacion = 0;

    for (const falla of fallas) {
      const mantenimiento = await Maintenance.findOne({ where: { BreakDownCode: falla.Code } });
      if (mantenimiento?.StartDate && mantenimiento?.EndDate) {
        tiempoTotalReparacion += calcularHorasTotales(mantenimiento.StartDate, mantenimiento.EndDate);
      }
    }

    const numFallos = fallas.length;
    const fechaInicio = equipo.InstallationDate || new Date();
    const fechaFin = new Date();
    const horasTotalesOperacion = calcularHorasTotales(fechaInicio, fechaFin);

    const MTBF = numFallos > 0 ? (horasTotalesOperacion / numFallos).toFixed(2) : 'N/A';
    const MTTR = numFallos > 0 ? (tiempoTotalReparacion / numFallos).toFixed(2) : 'N/A';

    let disponibilidad = '100';
    if (numFallos > 0 && horasTotalesOperacion > 0) {
      disponibilidad = ((horasTotalesOperacion - tiempoTotalReparacion) / horasTotalesOperacion * 100).toFixed(2);
    } else if (horasTotalesOperacion === 0) {
      disponibilidad = 'N/A';
    }

    const confiabilidad = numFallos > 0
      ? (Math.exp(-1 / (horasTotalesOperacion / numFallos)) * 100).toFixed(2)
      : '100';

    const workOrders = await WorkOrder.findAll({
      where: { EquipmentCode: code },
      include: [
        { model: OrderType, attributes: ['Name'] },
        { model: StopReason, attributes: ['Reason'] }
      ]
    });

    const conteoTipoW = {};
    workOrders.forEach(wo => {
      const tipo = wo.OrderType ? wo.OrderType.Name : 'Desconocido';
      conteoTipoW[tipo] = (conteoTipoW[tipo] || 0) + 1;
    });

    let arregloTipoW = Object.entries(conteoTipoW)
      .map(([tipo, cantidad]) => ({ tipo, cantidad }))
      .sort((a, b) => b.cantidad - a.cantidad);

    const totalWorkOrders = workOrders.length;
    let acumulado = 0;
    arregloTipoW = arregloTipoW.map(item => {
      acumulado += item.cantidad;
      return {
        ...item,
        porcentaje: ((item.cantidad / totalWorkOrders) * 100).toFixed(2),
        acumulado: ((acumulado / totalWorkOrders) * 100).toFixed(2)
      };
    });

    const conteoRazones = {};
    workOrders.forEach(wo => {
      const razon = wo.StopReason ? wo.StopReason.Reason : 'Sin razón registrada';
      conteoRazones[razon] = (conteoRazones[razon] || 0) + 1;
    });

    let arregloRazones = Object.entries(conteoRazones)
      .map(([tipo, cantidad]) => ({ tipo, cantidad }))
      .sort((a, b) => b.cantidad - a.cantidad);

    const total = arregloRazones.reduce((sum, item) => sum + item.cantidad, 0);
    let acumuladoRazones = 0;
    arregloRazones = arregloRazones.map(item => {
      acumuladoRazones += item.cantidad;
      return {
        ...item,
        porcentaje: ((item.cantidad / total) * 100).toFixed(2),
        acumulado: ((acumuladoRazones / total) * 100).toFixed(2)
      };
    });

    // ================== BLOQUE: Indicadores Mensuales y Comparación Anual ==================
    const anioActual = new Date().getFullYear();
    const anioInstalacion = new Date(equipo.InstallationDate).getFullYear();
    const indicadoresPorAnio = {};

    for (let anio = anioInstalacion; anio <= anioActual; anio++) {
      indicadoresPorAnio[anio] = [];

      for (let mes = 0; mes < 12; mes++) {
        const fallasMes = fallas.filter(f => {
          if (!f.DATE) return false;
          const fecha = new Date(f.DATE);
          return fecha.getFullYear() === anio && fecha.getMonth() === mes;
        });

        let tiempoReparacionMes = 0;
        for (const falla of fallasMes) {
          const mantenimiento = await Maintenance.findOne({ where: { BreakDownCode: falla.Code } });
          if (mantenimiento?.StartDate && mantenimiento?.EndDate) {
            tiempoReparacionMes += calcularHorasTotales(mantenimiento.StartDate, mantenimiento.EndDate);
          }
        }

        const numFallosMes = fallasMes.length;
        const diasMes = new Date(anio, mes + 1, 0).getDate();
        const horasOperacionMes = diasMes * 24;

        const MTBFmes = numFallosMes > 0 ? (horasOperacionMes / numFallosMes).toFixed(2) : 0;
        const MTTRmes = numFallosMes > 0 ? (tiempoReparacionMes / numFallosMes).toFixed(2) : 0;
        const disponibilidadMes = numFallosMes > 0 ? ((horasOperacionMes - tiempoReparacionMes) / horasOperacionMes * 100).toFixed(2) : 100;
        const confiabilidadMes = numFallosMes > 0 ? (Math.exp(-1 / (horasOperacionMes / numFallosMes)) * 100).toFixed(2) : 100;

        indicadoresPorAnio[anio].push({
          mes,
          MTBF: parseFloat(MTBFmes),
          MTTR: parseFloat(MTTRmes),
          disponibilidad: parseFloat(disponibilidadMes),
          confiabilidad: parseFloat(confiabilidadMes)
        });
      }
    }

    // ========================================================================
console.log('JSON indicadoresPorAnio raw:', JSON.stringify(indicadoresPorAnio));

    res.render('indicadores', {
      layout: 'equipmentReportLayout',
      equipo,
      name: equipo.Name,
      installationDate: equipo.InstallationDate,
      MTBF,
      MTTR,
      disponibilidad,
      confiabilidad,
      numFallos,
      tiempoTotalReparacion: tiempoTotalReparacion.toFixed(2),
      code,
      paretoData: arregloTipoW,
      paretoStopReasonData: arregloRazones,
      indicadoresPorAnio // <-- para comparación entre años en frontend
    });

  } catch (error) {
    console.error('Error al obtener indicadores:', error);
    res.status(500).send('Error interno del servidor');
  }
};*/


exports.departmentEquipmentsReport=(req,res) => {
code=req.params.code
var name=null 
    Department.findByPk(code).then(dep => {
        name=dep.dataValues.Name

    })
Equipment.findAll({where:{DepartmentCode:code},include:[{model:AgentSupplier}]}).then(equipments => {
    if(equipments){

        const eq = equipments.map(equipment => {
            return {
              Code: equipment.Code,
              Name: equipment.Name,
              Cost: equipment.Cost,
              InstallationDate: equipment.InstallationDate,
              Model:equipment.Model,
              SerialNumber:equipment.SerialNumber,
              Manufacturer:equipment.Manufacturer,
              Location:equipment.Location,
              Agent:equipment.AgentSupplier.Name,
              //aumentado en 02/03/25
              Software:equipment.Software,
              SoftwareVersion: equipment.SoftwareVersion,
              SoftwarePass: equipment.SoftwarePass,
              NetworkAddress: equipment.NetworkAddress,
              AssetStatus: equipment.AssetStatus,
              InsuranceStatus: equipment.InsuranceStatus,
              FuntionalStatus: equipment.FuntionalStatus
              //
            }
    
    
        })
        res.render('reportDepartmentEquipments',{layout:'departmentReportLayout',pageTitle:'Equipments',
                                                code:code,equipments:eq,hasEquipments:eq.length>0,
                                                Equipment:true,name:name})
    }

    else{
        res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!! Couldn\'t Find  Any Equipment For This Department',href:'/report/department/equipments/'+code})        
    }
}).catch(err => {
    if(err)
     res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!! Couldn\'t Find  Any Equipment For This Department',href:'/report/department/equipments/'+code})
})

}


exports.departmentEngineersReport=(req,res) => {
    code=req.params.code
    var name=null 
    Department.findByPk(code).then(dep => {
        name=dep.dataValues.Name

    })
    ClinicalEngineer.findAll({where:{DepartmentCode:code}}).then(engineers => {
        if(engineers){
            const en = engineers.map(engineer => {
                return{
                    DSSN:engineer.DSSN,
                    FName:engineer.FName,
                    LName:engineer.LName,
                    Adress:engineer.Adress,
                    Phone:engineer.Phone,
                    Email:engineer.Email,
                    Age:engineer.Age,
                    WorkHours:engineer.WorkHours,
                }
        
        
            })
            res.render('reportDepartmentEngineers',{layout:'departmentReportLayout',pageTitle:'Clinical Engineer',
                                                    code:code,engineers:en,hasEngineers:en.length>0,
                                                CE:true,name:name})
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!! Couldn\'t Find  Any Engineers For This Department',href:'/report/department/enginers/'+code})            
        }
    }).catch(err => {
        if(err)
        res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Engineers For This Department',href:'/report/department/enginers/'+code})
    })


}



exports.agentSparePartsReport=(req,res)=>{
    id=req.params.Id
    var name=null
    AgentSupplier.findByPk(id).then(agent => {
        name=agent.dataValues.Name
    })
    SparePart.findAll({where:{AgentSupplierId:id}}).then(spareparts => {
        if(spareparts){
            const sp = spareparts.map(sparepart => {
                return {
                  Code:sparepart.Code,
                  Name:sparepart.Name,
                  Amount:sparepart.Amount
                }
              })
              res.render('reportAgentSpareParts',{layout:'agentReportLayout',pageTitle:'Spare Parts',
                                    Id:id,name:name,SP:true,spareParts:sp,hasSP:sp.length>0})
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!! Couldn\'t Find  Any Spare Parts For This Agent',href:'/report/department/enginers/'+code})            

        }
    }).catch(err => {
        if(err)
        res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Spare Parts For This Agent',href:'/report/department/enginers/'+code})
    })
}

exports.agentEquipmentsReport=(req,res)=>{
    id=req.params.Id
    var name=null
    AgentSupplier.findByPk(id).then(agent => {
        name=agent.dataValues.Name
    })
    Equipment.findAll({where:{AgentSupplierId:id},include:[{model:Department}]}).then(equipments => {
        if(equipments){
            const eq = equipments.map(equipment => {
                return {
                    Code: equipment.Code,
                    Name: equipment.Name,
                    Cost: equipment.Cost,
                    InstallationDate: equipment.InstallationDate,
                    Model:equipment.Model,
                    SerialNumber:equipment.SerialNumber,
                    Manufacturer:equipment.Manufacturer,
                    Location:equipment.Location,
                    Department:equipment.Department.Name,
                    Software:equipment.Software,
                    //añadido el 02/03/25
                    SoftwareVersion: equipment.SoftwareVersion,
                    SoftwarePass: equipment.SoftwarePass,
                    NetworkAddress: equipment.NetworkAddress,
                    AssetStatus: equipment.AssetStatus,
                    InsuranceStatus: equipment.InsuranceStatus,
                    FuntionalStatus: equipment.FuntionalStatus
                    //
                }
              })
              res.render('reportAgentEquipments',{layout:'agentReportLayout',pageTitle:'Equipments',
                                    Id:id,name:name,Equipment:true,equipments:eq,hasEquipments:eq.length>0})
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!! Couldn\'t Find  Any Equipment For This Agent',href:'/report/department/enginers/'+code})            

        }
    }).catch(err => {
        if(err)
        res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Equipments For This Agent',href:'/report/department/enginers/'+code})
    })
}



exports.equipmentInstallationReport=(req,res)=>{
    id=req.params.Id
    layout=req.query.report ? 'main-layout' :'equipmentReportLayout' 
    Id=req.query.report ? false : true
    Reports=req.query.report ? true : false
    var date = Date(Date.now()).toString().split('GMT')[0]; 
    Equipment.findOne({where:{Code:id},include:[{model:AgentSupplier},{model:Department}]}).then(equipment => {
        if(equipment){
            const eq = {
                Code: equipment.Code,
                Name: equipment.Name,
                Cost: equipment.Cost,
                InstallationDate: equipment.InstallationDate,
                WarrantyDate: equipment.WarrantyDate,
                ArrivalDate: equipment.InstallationDate,
                Model:equipment.ModelId,
                SerialNumber:equipment.SerialNumber,
                Manufacturer:equipment.Manufacturer,
                Location:equipment.Location,
                Notes:equipment.Notes,
                PM:equipment.PM,
                Department:equipment.Department.Name,
                Agent:equipment.AgentSupplier.Name,
                //añadido el 02/03/25
                Software:equipment.Software,
                SoftwareVersion: equipment.SoftwareVersion,
                SoftwarePass: equipment.SoftwarePass,
                NetworkAddress: equipment.NetworkAddress,
                AssetStatus: equipment.AssetStatus,
                InsuranceStatus: equipment.InsuranceStatus,
                FuntionalStatus: equipment.FuntionalStatus
                //
              }

              res.render('installationReport',{layout:layout,pageTitle:'Installation',
                  code:id,equipment:eq,Date:date,ID:Id,Reports:Reports})
        }
        else
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Data for This Equipment ',href:'/report/department/enginers/'+code})


    })



}



exports.equipmentDialyInspectionReport=(req,res) => {
    id=req.params.Id
    var name=null
    var model =null
    var image=null
    Equipment.findByPk(id).then(eq => {
        name=eq.Name
        model=eq.Model
        image=eq.Image
        DialyInspection.findAll({where:{EquipmentCode:id},include:[{model:Equipment},{model:ClinicalEngineer}]})
        .then(reports => {
            const reps=reports.map(report => {
                return{
                    Code:report.Code,
                    DATE:report.DATE,
                    Engineer:report.ClinicalEngineer.FName +' '+ report.ClinicalEngineer.LName ,
                    Equipment:report.Equipment.Name,
                    EquipmentModel:report.Equipment.Model
                }
            })

            res.render('dialyinspectionTable',{layout:'equipmentReportLayout',pageTitle:'Dialy Inspection',
                    code:id,DI:true,reports:reps,hasReports:reps.length>0,name:name,model:model,image:image })   
        } )
    }).catch( err => {
        if(err)
        {
            console.log(err)
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Dialy Inspection Reports for This Equipment ',href:'/equipment'})
        }
    })
}


exports.dialyInspectionReport = (req,res) =>{
 code=req.params.code
 layout=req.query.report ? 'main-layout' :'equipmentReportLayout' 
 di=req.query.report ? false : true
 Reports=req.query.report ? true : false
 DialyInspection.findOne({where:{Code:code},include:[{model:ClinicalEngineer},{model:Equipment, include: [{ model: Model, as: 'model' }]}]}).then(report =>{
    const rep = {
        DATE:report.DATE,
        Engineer:report.ClinicalEngineer.FName+' '+report.ClinicalEngineer.LName,
        EquipmentName:report.Equipment.Name,
        EquipmentCode:report.Equipment.Code,
        EquipmentModel:report.Equipment.ModelId,
        P1:report.Equipment.model.Q1,
        P2:report.Equipment.model.Q2,
        P3:report.Equipment.model.Q3,
        P4:report.Equipment.model.Q4,
        P5:report.Equipment.model.Q5,
        Q1:report.Q1,
        Q2:report.Q2,
        Q3:report.Q3,
        Q4:report.Q4,
        Q5:report.Q5,
        Q6:report.Q6,
        Q7:report.Q7,
        Q8:report.Q8,

    }
    console.log(rep);
    rep.Q1 = rep.Q1 == "on" ? true: false
    rep.Q2 = rep.Q2 == "on" ? true: false
    rep.Q3 = rep.Q3 == "on" ? true: false
    rep.Q4 = rep.Q4 == "on" ? true: false
    rep.Q5 = rep.Q5 == "on" ? true: false
    rep.Q6 = rep.Q6 == "on" ? true: false
    rep.Q7 = rep.Q7 == "on" ? true: false
    rep.Q8 = rep.Q8 == "on" ? true: false   
    res.render('dialyinspection',{layout:layout,pageTitle:'Dialy Inspection',
        code:rep.EquipmentCode,DI:di,report:rep,Reports:Reports })  
 })
}



exports.equipmentPpmReport=(req,res) => {
    id=req.params.Id
    var name=null
    var model =null
    var image =null
    Equipment.findByPk(id).then(eq => {
        name=eq.Name
        model=eq.Model
        image=eq.Image
        PPM.findAll({where:{EquipmentCode:id},include:[{model:Equipment},{model:ClinicalEngineer}]})
        .then(reports => {
            const reps=reports.map(report => {
                return{
                    Code:report.Code,
                    DATE:report.DATE,
                    Engineer:report.ClinicalEngineer.FName +' '+ report.ClinicalEngineer.LName ,
                    Equipment:report.Equipment.Name,
                    EquipmentModel:report.Equipment.Model
                }
            })

            res.render('ppmTable',{layout:'equipmentReportLayout',pageTitle:'PPM',
                    code:id,PPM:true,reports:reps,hasReports:reps.length>0,name:name,model:model ,image:image})   
        } )
    }).catch( err => {
        if(err)
        {
            console.log(err)
            res.render('error',{layout:false,pageTitle:'Error',message:'Sorry!!  Error happend while getting Dialy Inspection Reports for This Equipment ',href:'/equipment'})
        }
    })
}


exports.PpmReport = (req,res) =>{
    code=req.params.code
    layout=req.query.report ? 'main-layout' :'equipmentReportLayout' 
    ppm=req.query.report ? false : true
    Reports=req.query.report ? true : false
    PPM.findOne({where:{Code:code},include:[{model:ClinicalEngineer},{model:Equipment}]}).then(report =>{
       const rep = {
           DATE:report.DATE,
           Engineer:report.ClinicalEngineer.FName+' '+report.ClinicalEngineer.LName,
           EquipmentName:report.Equipment.Name,
           EquipmentCode:report.Equipment.Code,
           EquipmentModel:report.Equipment.Model,
           Q1:report.Q1,
           Q2:report.Q2,
           Q3:report.Q3,
           Q4:report.Q4,
           Q5:report.Q5,
           N1:report.N1,
           N2:report.N2,
           N3:report.N3,
           N4:report.N4,
           N5:report.N5,
           signature: report.signature

       }
       rep.Q1 = rep.Q1 == "on" ? true: false
       rep.Q2 = rep.Q2 == "on" ? true: false
       rep.Q3 = rep.Q3 == "on" ? true: false
       rep.Q4 = rep.Q4 == "on" ? true: false
       rep.Q5 = rep.Q5 == "on" ? true: false
       PPMQuestions.findOne({where:{EquipmentCode:rep.EquipmentCode}}).then(questions => {
           const q={
               Q1:questions.Q1,
               Q2:questions.Q2,
               Q3:questions.Q3,
               Q4:questions.Q4,
               Q5:questions.Q5,
           }
           res.render('ppm',{layout:layout,pageTitle:'PPM',
               code:rep.EquipmentCode,PPM:ppm,Reports:Reports,report:rep ,questions:q})  
       })
    })
   }


exports.equipmentBreakDownReport=(req,res)=>{
code=req.params.Id
var name=null
var model =null
var image=null
Equipment.findByPk(code).then(eq => {
    name=eq.Name
    model=eq.Model
    image=eq.Image
    BreakDown.findAll({where:{EquipmentCode:code}}).then(breakdowns => {
        const bds=breakdowns.map(breakdown => {
            return {
                Code:breakdown.Code,
                Reason:breakdown.Reason,
                Date:breakdown.DATE
            }
        })
        res.render('equipmentBreakDowns',{layout:'equipmentReportLayout',pageTitle:'Break Downs',
            code:code,BD:true,breakDowns:bds,hasBreakDowns:bds.length>0,name:name,model:model,image:image })   
    })
})
}

exports.equipmentMaintenaceReport=(req,res) => {
    code=req.params.Id
    console.log(code);
    var name=null
    var model =null
    var image=null
    Equipment.findByPk(code).then(eq => {
        name=eq.Name
        model=eq.Model
        image=eq.Image
        Maintenance.findAll({include:[{model:BreakDown,where:{EquipmentCode:code}}]}).then(maintenances => {
            const ms=maintenances.map(maintenance => {
                return {
                    Id:maintenance.Id,
                    Description:maintenance.Description,
                    StartDate:maintenance.StartDate,
                    EndDate:maintenance.EndDate,
                    BreakDownCode:maintenance.BreakDown.Code,
                    BreakDownReason:maintenance.BreakDown.Reason
                }
            })
            res.render('equipmentMaintenance',{layout:'equipmentReportLayout',pageTitle:'Maintenances',
                code:code,M:true,maintenance:ms,hasMaintenances:ms.length>0,name:name,model:model ,image:image})   
        })
    })
}


exports.equipmentSparePartsReport = (req, res) => {
   // const equipmentId = req.params.Id;  // Obtén el ID del equipo desde los parámetros de la ruta
    code=req.params.Id
    Equipment.findOne({
      where: { Code: code },  // Encuentra el equipo por su código (o ID)
      include: {
        model: SparePart,            // Incluye los repuestos
        through: {                  // Especifica la tabla intermedia
          model: EquipmentSparePart, // Aquí agregas explícitamente el modelo de la tabla intermedia
          attributes: ['quantity']   // Obtén la cantidad de repuestos
        }
      }
    })
    .then(equipment => {
      if (!equipment) {
        return res.status(404).render('error', {
          message: 'Equipo no encontrado',
          pageTitle: 'Error'
        });
      }
      console.log(equipment); // Verifica que las propiedades existen

      console.log(equipment.SpareParts);
      // Renderiza la vista con los datos obtenidos
      res.render('equipmentSpareParts', {
        layout: 'equipmentReportLayout',  // Especifica el layout si lo tienes
        equipment: equipment.get({plain:true}),  // Equipos y sus repuestos
        spareParts: equipment.SpareParts.map (sparePart => sparePart.get({plain:true})),
        hasSpareParts: equipment.SpareParts && equipment.SpareParts.length > 0, 
        pageTitle: `Repuestos de equipo ${code}`,
        code: code
      });
    })
    .catch(err => {
      console.error('Error al obtener los repuestos del equipo:', err);
      res.status(500).render('error', {
        message: 'Error al obtener los repuestos del equipo',
        pageTitle: 'Error'
      });
    });
  };
  

exports.equipmentWorkOrderReport = async (req, res) => {
  const code = req.params.Id;
  let name = null;
  let model = null;
  let image = null;

  try {
    const eq = await Equipment.findByPk(code, {
      include: [{ model: Model, as: 'model', attributes: ['Model'] }] // para traer el nombre del modelo si quieres
    });
    if (!eq) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Equipo no encontrado',
        href: '/equipment',
        message: 'No se encontró el equipo solicitado.',
      });
    }

    name = eq.Name;
    model = eq.model ? eq.model.Model : null;
    image = eq.Image;

    const workorders = await WorkOrder.findAll({
      where: { EquipmentCode: code },
      include: [
        { model: OrderType, attributes: ['Name'] },
        { model: StopOrder, as: 'stopOrder', attributes: ['description'] }
      ]
    });

    const wos = workorders.map(wo => ({
      Code: wo.Code,
      StartDate: wo.StartDate,
      EndDate: wo.EndDate,
      Description: wo.Description,
      Cost: wo.Cost,
      Priority: wo.Priority,
      id_typeW: wo.id_typeW,         // 👈 añadimos esto
      id_StopOrder: wo.id_StopOrder, 
      OrderType: wo.OrderType,   // objeto con .Name
      stopOrder: wo.stopOrder // 👈 y esto
    }));

    res.render('equipmentWorkOrderReport', {
      layout: 'equipmentReportLayout',
      pageTitle: 'Work Orders',
      code,
      WO: true,
      workOrders: wos,
      hasWorkOrders: wos.length > 0,
      name,
      model,
      image
    });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      href: '/equipment',
      message: 'Ocurrió un error al obtener las órdenes de trabajo.'
    });
  }
};
