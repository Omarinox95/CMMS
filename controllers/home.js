const bcrypt = require('bcryptjs')
const Department =require('../models/department');
const AgentSupplier =require('../models/agent_supplier');
const BreakDown =require('../models/break_down');
const ClinicalEngineer =require('../models/clinical_engineer');
const Equipment =require('../models/equipment');
const Maintenance =require('../models/maintenance');
const SparePart =require('../models/spare_part');
const WorkOrder=require('../models/work_order');
const DailyInspection = require('../models/dialy_inspection');
const PpmQuestions =require('../models/ppm_questions')
const PPM =require('../models/ppm')
const moment=require('moment')
const Category = require('../models/category');
const ReceptionStatus = require('../models/ReceptionStatus');  // Agrega esta línea
const AcquisitionType = require('../models/AcquisitionType');  // Y esta línea
const PreventiveTask = require('../models'); // si no está ya importado
const { Brand, NameEquipment, Model } = require('../models');
const { OrderType, StopReason, RepairStage } = require('../models'); // ajusta el path si es necesario

exports.homeSignIn=(req,res) => {
    res.render('newHome',{layout:false});
}


exports.signIn=(req,res) => {
   email=req.body.email
   pass=req.body.password
   if(email == 'admin@gmail.com' && pass==0000){
    req.session.DSSN = 1;
    res.redirect('/home');  
   }
   else{
       ClinicalEngineer.findOne({where:{Email:email}}).then(clinicalengineer => {
           if(clinicalengineer){
            bcrypt.compare(pass, clinicalengineer.Password).then(result => {
                if(result){
                 req.session.DSSN=clinicalengineer.DSSN
                 res.redirect('/engineer/dialyInspection');  
                }
                else
                 res.redirect('/')    
                })
           }
           else
           res.redirect('/')    
            
       })
   }
   
}

exports.home=(req,res) =>{
    res.render('home',{pageTitle:'Home',Home:true});
}

exports.dialyInspectionEngineer=(req,res) =>{
    engineerId=req.session.DSSN
    Equipment.findAll({include:[{model:Department}]}).then(equipments => {
        const eqs=equipments.map(equipment => {
            return{
                Name:equipment.Name,
                Code:equipment.Code,
                Department:equipment.Department.Name
            }
        })
        ClinicalEngineer.findByPk(engineerId).then(engineer => {
            const Engineer ={
                Image:engineer.Image,
                FName:engineer.FName,
                LName:engineer.LName
            }
        res.render('dialyInspectionForm',{layout:'clinicalEngineerLayout',pageTitle:'Dialy Inspection',
        DI:true,equipments:eqs,Engineer:Engineer})
        })
    })
}

exports.dialyInspectionEngineerPost=(req,res) =>{
 code = req.body.Code
 date = req.body.DATE
 q1 = req.body.Q1
 q2 = req.body.Q2
 q3 = req.body.Q3
 q4 = req.body.Q4
 q5 = req.body.Q5
 q6 = req.body.Q6
 q7 = req.body.Q7
 q8 = req.body.Q8
 equipmentId = req.body.Device
 engineerId=req.session.DSSN


 q1 = q1 == "on" ? "on": "off"
 q2 = q2 == "on" ? "on": "off"
 q3 = q3 == "on" ? "on": "off"
 q4 = q4 == "on" ? "on": "off"
 q5 = q5 == "on" ? "on": "off"
 q6 = q6 == "on" ? "on": "off"
 q7 = q7 == "on" ? "on": "off"
 q8 = q8 == "on" ? "on": "off"

 
     

 
 Equipment.findByPk(equipmentId).then(equipment => { 
     if(equipment){
         ClinicalEngineer.findByPk(engineerId).then(clinicalengineer =>{
             if(clinicalengineer){
                    DailyInspection.create({DATE:date,Q1:q1,Q2:q2,Q3:q3,Q4:q4,Q5:q5,Q6:q6,Q7:q7,Q8:q8,EquipmentCode:equipmentId,ClinicalEnginnerDSSN:engineerId})
                        .then(dailyinspection => res.redirect('/engineer/dialyInspection') )
            }
            else{
                res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/dialyInspection',message:'Sorry !!! Could Not Get this Engineer'})
            } 
         })   
     }
     else{
         res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/dialyInspection',message:'Sorry !!! Could Not Get this Equipment'})
     }
 }).catch(err => {
     if(err){
         console.log(err)
      res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/dialyInspection',message:'Sorry !!! Could Not Add This Report '})
     }
       
 })

}


exports.ppmEngineer=(req,res) =>{
    engineerId=req.session.DSSN
    PpmQuestions.findAll({include:[{model:Equipment,include:[{model:Department}]}]}).then(reports=>{
        const eqs=reports.map(report => {
            return {
                Name:report.Equipment.Name,
                Code:report.Equipment.Code,
                Department:report.Equipment.Department.Name
            }
        })
        ClinicalEngineer.findByPk(engineerId).then(engineer => {
            const Engineer ={
                Image:engineer.Image,
                FName:engineer.FName,
                LName:engineer.LName
            }
            res.render('deviceForm',{layout:'clinicalEngineerLayout',pageTitle:'Dialy Inspection',
                PPM:true,equipments:eqs,Engineer:Engineer})
        })
    })

}
exports.ppmEngineerPost=(req,res) =>{
    code=req.body.Code
    res.redirect('/engineer/ppm/'+code);
}

//MANTENIMIENTO PREVENTIVO
exports.ppmEngineerEquipment =(req,res) => {
    code=req.params.code
    engineerId=req.session.DSSN
    PpmQuestions.findOne({where:{EquipmentCode:code}}).then(ppm => {
        const Ppm={
            Q1:ppm.Q1,
            Q2:ppm.Q2,
            Q3:ppm.Q3,
            Q4:ppm.Q4,
            Q5:ppm.Q5
        }
        ClinicalEngineer.findByPk(engineerId).then(engineer => {
            const Engineer ={
                Image:engineer.Image,
                FName:engineer.FName,
                LName:engineer.LName
            }

        res.render('ppmForm',{layout:'clinicalEngineerLayout',pageTitle:'Dialy Inspection',
            PPM:true,ppm:Ppm,Code:code,Engineer:Engineer})
        })
    })
}
/*exports.ppmEngineerEquipmentPost=(req,res) =>{
    date=req.body.DATE
    equipmentId=req.params.Code
    engineerId=req.session.DSSN
    q1 = req.body.Q1
    q2 = req.body.Q2
    q3 = req.body.Q3
    q4 = req.body.Q4
    q5 = req.body.Q5
    n1 = req.body.N1
    n2 = req.body.N2
    n3 = req.body.N3
    n4 = req.body.N4
    n5 = req.body.N5
    q1 = q1 == "on" ? "on": "off"
    q2 = q2 == "on" ? "on": "off"
    q3 = q3 == "on" ? "on": "off"
    q4 = q4 == "on" ? "on": "off"
    q5 = q5 == "on" ? "on": "off"

    Equipment.findByPk(equipmentId).then(equipment => { 
        if(equipment){
            ClinicalEngineer.findByPk(engineerId).then(clinicalengineer =>{
                if(clinicalengineer){
                       PPM.create({DATE:date,Q1:q1,Q2:q2,Q3:q3,Q4:q4,Q5:q5,N1:n1,N2:n2,N3:n3,N4:n4,N5:n5,EquipmentCode:equipmentId,ClinicalEnginnerDSSN:engineerId})
                           .then(dailyinspection => res.redirect('/engineer/ppm') )
               }
               else{
                   res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/ppm',message:'Sorry !!! Could Not Get this Engineer'})
               } 
            })   
        }
        else{
            res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/ppm',message:'Sorry !!! Could Not Get this Equipment'})
        }
    }).catch(err => {
        if(err){
            console.log(err)
         res.render('error',{layout:false,pageTitle:'Error',href:'/engineer/ppm',message:'Sorry !!! Could Not Add This Report '})
        }
          
    })
}
*/

exports.ppmEngineerEquipmentPost = (req, res) => {
    const date = req.body.DATE;
    const equipmentId = req.params.Code;
    const engineerId = req.session.DSSN;

    let q1 = req.body.Q1 == "on" ? "on" : "off";
    let q2 = req.body.Q2 == "on" ? "on" : "off";
    let q3 = req.body.Q3 == "on" ? "on" : "off";
    let q4 = req.body.Q4 == "on" ? "on" : "off";
    let q5 = req.body.Q5 == "on" ? "on" : "off";

    const n1 = req.body.N1;
    const n2 = req.body.N2;
    const n3 = req.body.N3;
    const n4 = req.body.N4;
    const n5 = req.body.N5;

    Equipment.findByPk(equipmentId).then(equipment => {
        if (equipment) {
            ClinicalEngineer.findByPk(engineerId).then(clinicalengineer => {
                if (clinicalengineer) {
                    PPM.create({
                        DATE: date,
                        Q1: q1, Q2: q2, Q3: q3, Q4: q4, Q5: q5,
                        N1: n1, N2: n2, N3: n3, N4: n4, N5: n5,
                        EquipmentCode: equipmentId,
                        ClinicalEnginnerDSSN: engineerId
                    }).then(async ppm => {
                        // 🔁 Aquí actualizamos la tarea a "Finalizada"
                        await PreventiveTask.update(
                            { Status: 'Finalizada', updatedAt: new Date() },
                            {
                                where: {
                                    EquipmentCode: equipmentId,
                                    Status: 'Programada'
                                }
                            }
                        );
                        res.redirect('/engineer/ppm');
                    });
                } else {
                    res.render('error', {
                        layout: false,
                        pageTitle: 'Error',
                        href: '/engineer/ppm',
                        message: 'Sorry !!! Could Not Get this Engineer'
                    });
                }
            });
        } else {
            res.render('error', {
                layout: false,
                pageTitle: 'Error',
                href: '/engineer/ppm',
                message: 'Sorry !!! Could Not Get this Equipment'
            });
        }
    }).catch(err => {
        console.log(err);
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/engineer/ppm',
            message: 'Sorry !!! Could Not Add This Report'
        });
    });
};


exports.department=(req,res)=>{
Department.findAll({
    include:[{model:Equipment}]
    }).then(departments => {
        const deps = departments.map(department => {       
            return {
                        Name: department.Name,
                        Code: department.Code,
                        Location: department.Location,
                        Equipments:department.Equipment.length
                    }
                })      

    res.render('department',{pageTitle:'Department',
                            Department:true,
                            departments:deps,
                            hasDepartment:deps.length>0});
                    
}).catch(err => {
    if(err){
        console.log(err)    
        res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get Departments'})
     }
    })


}

exports.maintenance=(req,res)=>{
    Maintenance.findAll({include:[{model:BreakDown,include:[{model:Equipment,include:[{model:Department}]}]},{model:ClinicalEngineer}]}).then(maintenances => {
        const m = maintenances.map(main => {
                  return {
                    Id:main.Id,
                    StartDate:main.StartDate,
                    EndDate:main.EndDate,
                    BreakDownCode:main.BreakDown.Code,
                    EquipmentName:main.BreakDown.Equipment.Name,
                    EquipmentCode:main.BreakDown.Equipment.Code,
                    EquipmentImage:main.BreakDown.Equipment.Image,
                    ClinicalEngineer:main.ClinicalEngineer.FName+' '+main.ClinicalEngineer.LName,
                    ClinicalEngineerImage:main.ClinicalEngineer.Image,
                    Department:main.BreakDown.Equipment.Department.Name,
                    Description:main.Description             
                  }
                    
                })
    BreakDown.findAll({include:[{model:Equipment}]}).then(breakDowns => {
        const bd=breakDowns.map(breakDown => {
            return {
                Code:breakDown.Code,
                Date:breakDown.DATE,
                EquipmentName:breakDown.Equipment.Name,
                EquipmentCode:breakDown.Equipment.Code,
                Reason:breakDown.Reason
            }

        })
     
    ClinicalEngineer.findAll().then(clinicalEngineers => {
        const en=clinicalEngineers.map(clinicalEngineer => {
            return {
                FName:clinicalEngineer.FName,
                LName:clinicalEngineer.LName,
                DSSN:clinicalEngineer.DSSN
            }
        })
        res.render('maintenance',{pageTitle:'Maintenance',
                                    Maintenance:true,Maintenances:m,
                                    hasMaintenance:m.length>0,Engineers:en,breakDowns:bd});
    })    
    })


    }).catch(err => {
        if(err)
          console.log(err)
          res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not get any maintenance'})
    })


}


exports.clinicalEngineer=(req,res)=>{
    ClinicalEngineer.findAll().then(clinicalEngineers=>{
        const clinicalengineers=clinicalEngineers.map(clinicalengineer => {     
            return{
                DSSN:clinicalengineer.DSSN,
                FName:clinicalengineer.FName,
                LName:clinicalengineer.LName,
                Image:clinicalengineer.Image,
                Adress:clinicalengineer.Adress,
                Phone:clinicalengineer.Phone,
                Email:clinicalengineer.Email,
                Age:clinicalengineer.Age,
                WorkHours:clinicalengineer.WorkHours,
            }

        })
        res.render('clinicalEngineer',{pageTitle:'clinicalEngineer',CE:true,
                                clinicalEngineers:clinicalengineers,hasEngineers:clinicalengineers.length>0});
    })
    .catch(err => {
        if(err)
         res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get Engineers'})
    })
    
}

//ultimo cambio de 03/03/25 20:52
exports.sparePart = (req, res) => {
    SparePart.findAll({
        include: [
            { model: AgentSupplier },
            { model: Category },
            { model: Brand } 
        ]
    })
    .then(spareparts => {
        console.log(JSON.stringify(spareparts, null, 2));
        const sp = spareparts.map(sparepart => {
            return {
                Code: sparepart.Code,
                Name: sparepart.Name,
                Amount: sparepart.Amount,
                Image: sparepart.Image,
                AgentSupplierId: sparepart.AgentSupplier ? sparepart.AgentSupplier.Id : null,
                AgentSupplierName: sparepart.AgentSupplier ? sparepart.AgentSupplier.Name : "Sin proveedor",
                EquipmentName: sparepart.Equipment ? sparepart.Equipment.Name : "Sin equipo",
                CategoryName: sparepart.Category ? sparepart.Category.Name : "Sin categoría",
                BrandName: sparepart.brand ? sparepart.brand.Brand : "Sin marca"  // <-- la marca aquí
            };
        });

        return Brand.findAll()
            .then(brands => {
                const br = brands.map(brand => {
                    return {
                        id_brand: brand.id_brand,
                        Brand: brand.Brand
                    };
                });
            // Obtener Proveedores
            return AgentSupplier.findAll()
            .then(agents => {
                const ag = agents.map(agent => {
                    return {
                        Name: agent.Name,
                        Id: agent.Id
                    };
                });

                // Obtener Categorías
                return Category.findAll()
                .then(categories => {
                    const cat = categories.map(category => {
                        return {
                            id: category.IdCat,
                            name: category.Name
                        };
                    });

                    res.render('sparePart', {
                        pageTitle: 'SpareParts',
                        SP: true,
                        SpareParts: sp,
                        hasPart: sp.length > 0,
                        Agents: ag,
                        categories: cat,
                        brands: br,
                    });
                });
            });
        });
    })
    .catch(err => {
        console.error("Error al obtener los repuestos:", err);
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/home',
            message: 'Sorry !!! Could Not Get Spare Parts'
        });
    });
};


//
exports.agentSupplier=(req,res)=>{
    AgentSupplier.findAll().then(agentsuppliers => {
        const as = agentsuppliers.map(agentsupplier => {
                  return {
                    Name: agentsupplier.Name,
                    Id: agentsupplier.Id,
                    Adress: agentsupplier.Adress,
                    Phone:agentsupplier.Phone,
                    Email:agentsupplier.Email,
                    Notes:agentsupplier.Notes
                  }
                })

    res.render('agentSupplier',{pageTitle:'AgentSupplier',
                                AS:true,agentSuppliers:as,
                                hasAgentSupplier:as.length>0});
    }).catch(err => {
        if(err)
        res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get Agents'})
    })
}


/*exports.workOrder=(req,res)=>{

  WorkOrder.findAll({include:[{model:ClinicalEngineer},{model:Equipment}]}).then(workorders => {
        const wd = workorders.map(workD => {
                  return {
                    Code:workD.Code,
                    Cost:workD.Cost,
                    StartDate:workD.StartDate,
                    EndDate:workD.EndDate,
                    med:workD.Priority=='Medium'?true:false,
                    high:workD.Priority=='High'?true:false,
                    low:workD.Priority=='Low'?true:false,
                    EquipmentCode:workD.Equipment.Code,
                    EquipmentName:workD.Equipment.Name,
                    EquipmentImage:workD.Equipment.Image,
                    Priority:workD.Priority,
                    Description:workD.Description,
                    ClinicalEnginner:workD.ClinicalEnginner.FName+' '+workD.ClinicalEnginner.LName,
                    ClinicalEnginnerImage:workD.ClinicalEnginner.Image             
                  }
                })

        ClinicalEngineer.findAll().then(clinicalEngineers => {
            const en=clinicalEngineers.map(clinicalEngineer => {
                return {
                    FName:clinicalEngineer.FName,
                    LName:clinicalEngineer.LName,
                    DSSN:clinicalEngineer.DSSN
                }
            })
        Equipment.findAll({include:[{model:Department}]}).then(equipments => {
            const eq = equipments.map(equipment => {
                return{
                    Code:equipment.Code,
                    Name:equipment.Name,
                    DepartmentName:equipment.Department.Name
                }
            }) 
        const orderTypes = await OrderType.findAll();
        const stopReasons = await StopReason.findAll();
        const repairStages = await RepairStage.findAll();

            res.render('workOrder',{pageTitle:'WorkOrder',
                                        WorkOrder:true,Workorders:wd,
                                        hasWorkOrder:wd.length>0,WO:true,Engineers:en,Equipments:eq, 
                                        OrderTypes: orderTypes, StopReasons: stopReasons,
                                        RepairStages: repairStages});
        })    
        })       

    }).catch(err => {
        if(err)
          console.log(err)
          res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get WorkOrders'})
    })

}*/
exports.workOrder = (req, res) => {
  WorkOrder.findAll({ include: [{ model: ClinicalEngineer }, { model: Equipment }] })
    .then(workorders => {
      const wd = workorders.map(workD => ({
        Code: workD.Code,
        Cost: workD.Cost,
        StartDate: workD.StartDate,
        EndDate: workD.EndDate,
        med: workD.Priority == 'Medium',
        high: workD.Priority == 'High',
        low: workD.Priority == 'Low',
        EquipmentCode: workD.Equipment.Code,
        EquipmentName: workD.Equipment.Name,
        EquipmentImage: workD.Equipment.Image,
        Priority: workD.Priority,
        Description: workD.Description,
        ClinicalEngineer: workD.ClinicalEngineer.FName + ' ' + workD.ClinicalEngineer.LName,
        ClinicalEngineerImage: workD.ClinicalEngineer.Image
      }));

      ClinicalEngineer.findAll()
        .then(clinicalEngineers => {
          const en = clinicalEngineers.map(c => ({
            FName: c.FName,
            LName: c.LName,
            DSSN: c.DSSN
          }));

          Equipment.findAll({ include: [{ model: Department }] })
            .then(equipments => {
              const eq = equipments.map(e => ({
                Code: e.Code,
                Name: e.Name,
                DepartmentName: e.Department.Name
              }));

              OrderType.findAll()
                .then(orderTypesRaw => {
                  const orderTypes = orderTypesRaw.map(o => o.get({ plain: true }));

                  StopReason.findAll()
                    .then(stopReasonsRaw => {
                      const stopReasons = stopReasonsRaw.map(s => s.get({ plain: true }));

                      RepairStage.findAll()
                        .then(repairStagesRaw => {
                          const repairStages = repairStagesRaw.map(r => r.get({ plain: true }));

                          res.render('workOrder', {
                            pageTitle: 'WorkOrder',
                            WorkOrder: true,
                            Workorders: wd,
                            hasWorkOrder: wd.length > 0,
                            WO: true,
                            Engineers: en,
                            Equipments: eq,
                            OrderTypes: orderTypes,
                            StopReasons: stopReasons,
                            RepairStages: repairStages
                          });
                        });
                    });
                });
            });
        });
    })
    .catch(err => {
      console.error(err);
      res.render('error', {
        layout: false,
        pageTitle: 'Error',
        href: '/home',
        message: '¡Lo sentimos! No se pudieron cargar las órdenes de trabajo.'
      });
    });
};


exports.breakDown=(req,res)=>{
    BreakDown.findAll({include:[{model:Equipment,include:[{model:Department}]}]}).then(breakdowns => {
        const bd = breakdowns.map(breakD => {
                  return {
                    Code:breakD.Code,
                    Reason:breakD.Reason,
                    DATE:breakD.DATE,
                    EquipmentCode:breakD.EquipmentCode,
                    EquipmentName:breakD.Equipment.Name,
                    EquipmentImage:breakD.Equipment.Image,
                    Department:breakD.Equipment.Department.Name
                  }
                })
        Equipment.findAll({include:[{model:Department}]}).then(equipments => {
            const eqs = equipments.map(equipment => {
                return{
                    Name:equipment.Name,
                    Code:equipment.Code,
                    Department:equipment.Department.Name
                }
            })
        res.render('breakDown',{pageTitle:'BreakDown',BreakDown:true,breakDowns:bd,
                                    hasBreakDown:bd.length>0,Equipments:eqs});
        })

    }).catch(err => {
        if(err)
        res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get BreakDowns'})
    })
}

//equipment nuevo 28/05
exports.equipment = async (req, res) => {
  try {
    const equipments = await Equipment.findAll({
      include: [
        { model: Department, as: 'Department' },
        { model: AgentSupplier },
        { model: SparePart },
        { model: NameEquipment, as: 'equipmentType' },
        { model: Model, as: 'model'},
      ]
    });

    const eq = equipments.map(equipment => ({
      Code: equipment.Code,
      Name: equipment.Name,
      Cost: equipment.Cost,
      Image: equipment.Image,
      InstallationDate: equipment.InstallationDate,
      ArrivalDate: equipment.ArrivalDate,
      WarrantyDate: equipment.WarrantyDate,
      Model: equipment.model ? equipment.model.Model:null,
      SerialNumber: equipment.SerialNumber,
      Manufacturer: equipment.Manufacturer,
      Location: equipment.Location,
      Notes: equipment.Notes,
      DepartmentName: equipment.Department ? equipment.Department.Name : 'Sin departamento',
      AgentSupplierId: equipment.AgentSupplier?.Name,
      Software: equipment.Software,
      SoftwareVersion: equipment.SoftwareVersion,
      SoftwarePass: equipment.SoftwarePass,
      NetworkAddress: equipment.NetworkAddress,
      AssetStatus: equipment.AssetStatus,
      InsuranceStatus: equipment.InsuranceStatus,
      FuntionalStatus: equipment.FuntionalStatus,
      TypeName: equipment.equipmentType?.Name,
      SpareParts: equipment.SpareParts?.map(sp => ({
        Code: sp.Code,
        Name: sp.Name
      }))
    }));

    // Obtener agentes, repuestos y otros datos en paralelo
    const [agents, spareParts, receptionStatuses, acquisitionTypes, departments, nameEquipments, brands, models] = await Promise.all([
      AgentSupplier.findAll(),
      SparePart.findAll(),
      ReceptionStatus.findAll(),
      AcquisitionType.findAll(),
      Department.findAll(),
      NameEquipment.findAll(),
      Brand.findAll(),
      Model.findAll()
    ]);

    const ag = agents.map(agent => ({
      Name: agent.Name,
      Id: agent.Id
    }));

    const sp = spareParts.map(spare => ({
      Code: spare.Code,
      Name: spare.Name
    }));

    const deptOptions = departments.map(dep => ({
      Code: dep.Code,
      Name: dep.Name
    }));

    const plainReceptionStatuses = receptionStatuses.map(rs => ({
      Id: rs.Id,
      Name: rs.Name
    }));

    const plainAcquisitionTypes = acquisitionTypes.map(at => ({
      Id: at.Id,
      Name: at.Name
    }));

    const typeOptions = nameEquipments.map(type => ({
      id: type.id_nameE,
      name: type.Name
    }));

    const brandOptions = brands.map(brand => ({
        id_brand: brand.id_brand,
        Brand: brand.Brand
    }));

    const modelOptions = models.map(model => ({
      id: model.id,
      Model: model.Model
    }));

    res.render('equipment', {
      pageTitle: 'Equipment',
      Equipment: true,
      equipments: eq,
      hasEquipments: eq.length > 0,
      Agents: ag,
      spareParts: sp,
      receptionStatuses: plainReceptionStatuses,
      acquisitionTypes: plainAcquisitionTypes,
      departments: deptOptions,
      Types: typeOptions,
      Brands: brandOptions,
      Models: modelOptions,
    });
  } catch (err) {
    console.error('Error en equipment controller:', err);
    res.render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'No se pudieron obtener los datos necesarios para la vista.'
    });
  }
};

//es el funcional 28/05
/*exports.equipment = (req, res) => {
    Equipment.findAll({
        include: [
            { model: Department, as: 'Department' },
            { model: AgentSupplier },
            { model: SparePart },
            { model: NameEquipment, as: 'equipmentType' }//añadido
        ]
    }).then(equipments => {
        const eq = equipments.map(equipment => {
            return {
                Code: equipment.Code,
                Name: equipment.Name,
                Cost: equipment.Cost,
                PM: equipment.PM,
                Image: equipment.Image,
                InstallationDate: equipment.InstallationDate,
                ArrivalDate: equipment.ArrivalDate,
                WarrantyDate: equipment.WarrantyDate,
                Model: equipment.Model,
                SerialNumber: equipment.SerialNumber,
                Manufacturer: equipment.Manufacturer,
                Location: equipment.Location,
                Notes: equipment.Notes,
                DepartmentName: equipment.Department,
                AgentSupplierId: equipment.AgentSupplier?.dataValues.Name,
                Software: equipment.Software,
                SoftwareVersion: equipment.SoftwareVersion,
                SoftwarePass: equipment.SoftwarePass,
                NetworkAddress: equipment.NetworkAddress,
                AssetStatus: equipment.AssetStatus,
                InsuranceStatus: equipment.InsuranceStatus,
                FuntionalStatus: equipment.FuntionalStatus,
                TypeName: equipment.equipmentType?.Name,//añadido
                SpareParts: equipment.SpareParts?.map(sp => ({
                    Code: sp.Code,
                    Name: sp.Name
                }))
            };
        });

        AgentSupplier.findAll().then(agents => {
            const ag = agents.map(agent => {
                return {
                    Name: agent.Name,
                    Id: agent.Id
                };
            });

            // Obtener los repuestos
            SparePart.findAll().then(spareParts => {
                const sp = spareParts.map(spare => ({
                    Code: spare.Code,
                    Name: spare.Name
                }));

                // Obtener receptionStatuses y acquisitionTypes
                Promise.all([
                    ReceptionStatus.findAll(),  // Obtener los estados de recepción
                    AcquisitionType.findAll(),   // Obtener los tipos de adquisición
                    Department.findAll(),
                    NameEquipment.findAll()//añadido
                ])
                .then(([receptionStatuses, acquisitionTypes, departments, nameEquipments]) => {
                    
                    const deptOptions = departments.map(dep=> ({
                        Code:dep.Code,
                        Name:dep.Name
                    }))
                    const plainReceptionStatuses = receptionStatuses.map(rs => ({
                        Id: rs.Id,
                        Name: rs.Name
                    }));
                
                    const plainAcquisitionTypes = acquisitionTypes.map(at => ({
                        Id: at.Id,
                        Name: at.Name
                    }));

                    //añadido
                    const typeOptions = nameEquipments.map(type => ({
                        id: type.id_nameE,
                        name: type.Name
                    }));

                
                    res.render('equipment', {
                        pageTitle: 'Equipment',
                        Equipment: true,
                        equipments: eq,
                        hasEquipments: eq.length > 0,
                        Agents: ag,
                        spareParts: sp,
                        receptionStatuses: plainReceptionStatuses,
                        acquisitionTypes: plainAcquisitionTypes,
                        departments: deptOptions,
                        typeOptions: typeOptions
                    });
                })
                
                .catch(err => {
                    console.error('Error al obtener receptionStatuses o acquisitionTypes:', err);
                    res.render('error', { layout: false, pageTitle: 'Error', message: 'No se pudieron obtener los estados de recepción o tipos de adquisición' });
                });
            });
        });
        
    }).catch(err => {
        console.error('Error al obtener los equipos:', err);
        res.render('error', { layout: false, pageTitle: 'Error', href: '/home', message: 'Sorry !!! Could Not Get Equipments' });
    });
};*/


exports.installation=(req,res)=>{
    Equipment.findAll({
        include:[{model:Department},{model:AgentSupplier}]
        }).then(equipments => {
        const eq = equipments.map(equipment => {
                  return {
                    Code: equipment.Code,
                    Name: equipment.Name,
                    Cost: equipment.Cost,
                    PM:equipment.PM,
                    Image:equipment.Image,
                    InstallationDate: equipment.InstallationDate,
                    ArrivalDate:equipment.ArrivalDate,
                    WarrantyDate:equipment.WarrantyDate,
                    Model:equipment.Model,
                    SerialNumber:equipment.SerialNumber,
                    Manufacturer:equipment.Manufacturer,
                    Location:equipment.Location,
                    Notes:equipment.Notes,
                    DepartmentCode:equipment.Department.dataValues.Name,
                    AgentSupplierId:equipment.AgentSupplier.dataValues.Name,
                    //añadido 02/03/25
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
        res.render('installationTable',{pageTitle:'Installation',Reports:true,
                                reports:eq,hasReports:eq.length>0});
    }).catch( err => {
        if(err)
         res.render('error',{layout:false,pageTitle:'Error',href:'/',message:'Sorry !!! Could Not Get Reports'})
        })
}

exports.ppm=(req,res) =>{
PPM.findAll({include:[{model:Equipment,include:[{model:PpmQuestions}]},{model:ClinicalEngineer}]}).then(reports => {
    const reps=reports.map(report =>{
        return {
        Code:report.Code,
        DATE:report.DATE,
        Engineer:report.ClinicalEnginner.FName+' '+report.ClinicalEnginner.LName,
        EquipmentName:report.Equipment.Name,
        EquipmentCode:report.Equipment.Code,
        EquipmentModel:report.Equipment.Model,
        Qs:report.Equipment.PpmQuestion,
        Q1: report.Q1 == "on" ? true: false,
        Q2: report.Q2 == "on" ? true: false,
        Q3: report.Q3 == "on" ? true: false,
        Q4: report.Q4 == "on" ? true: false,
        Q5: report.Q5 == "on" ? true: false,
        N1:report.N1,
        N2:report.N2,
        N3:report.N3,
        N4:report.N4,
        N5:report.N5
        }
    })
    res.render('ppmReportTable',{pageTitle:'PPM',
        Reports:true,reports:reps,hasReports:reps.length>0,rep:true })   
    
}).catch(err => {
    res.render('error',{layout:false,pageTitle:'Error',href:'/home',message:'Sorry !!! Could Not Get Reports'})

})
}

exports.dailyInspection=(req,res)=>{
 DailyInspection.findAll({include:[{model:Equipment},{model:ClinicalEngineer}]})
 .then(reports => {
    const reps=reports.map(report => {
        return{
            Code:report.Code,
            DATE:report.DATE,
            Engineer:report.ClinicalEngineer.FName +' '+ report.ClinicalEngineer.LName ,
            Equipment:report.Equipment.Name,
            eq:true,
            EquipmentModel:report.Equipment.Model
        }

 })
 res.render('dialyinspectionTable',{pageTitle:'Daily Inspection',
    Reports:true,eq:true,reports:reps,hasReports:reps.length>0 })  
}).catch(err => {
    res.render('error',{layout:false,pageTitle:'Error',href:'/',message:'Sorry !!! Could Not Get Report'})

})

}


exports.workorder=(req,res) =>{
dssn=req.session.DSSN
WorkOrder.findAll({where:{ClinicalEnginnerDSSN:dssn}}).then(orders => {
    var events=orders.map(order => {
        return{
            title:order.Description,
            color:order.Priority == 'Low' ? 'green' :order.Priority == 'High' ? 'red': 'blue' ,
            start:(order.StartDate.split('-')[0]+'-'+order.StartDate.split('-')[1]+'-'+order.StartDate.split('-')[2])+' '+'00:00:00Z',
            end:(order.EndDate.split('-')[0]+'-'+order.EndDate.split('-')[1]+'-'+order.EndDate.split('-')[2])+' '+'23:00:00Z',
            url:'/engineer/workOrder/description/'+order.Code
        }

    })

    ClinicalEngineer.findByPk(engineerId).then(engineer => {
        const Engineer ={
            Image:engineer.Image,
            FName:engineer.FName,
            LName:engineer.LName
        }
        
    res.render('calender',{layout:false,WO:true,events:events,pageTitle:'calender',Engineer:Engineer})
    })

}).catch(err => {
    res.render('error',{layout:false,pageTitle:'Error',href:'/',message:'Sorry !!! Could Not Get Orders'})

})

}

exports.workorderDescription=(req,res)=>{
    code=req.params.code
    engineerId=req.session.DSSN
    WorkOrder.findOne({where:{Code:code},include:[{model:Equipment},{ model: OrderType, /*attributes: ['work'] */},       // o el nombre que uses
    { model: StopReason, /*attributes: ['Description']*/ },
    { model: RepairStage, attributes: ['Status'] } ]}).then(order => {
        console.log('Order raw data:', JSON.stringify(order, null, 2));
  console.log('OrderType:', order.OrderType);
  console.log('StopReason:', order.StopReason);
        var order={
            Code:order.Code,
            EquipmentName:order.Equipment.Name,
            EquipmentModel:order.Equipment.Model,
            EquipmentCode:order.Equipment.Code,
            Priority:order.Priority,
            Cost:order.Cost,
            StartDate:order.StartDate,
            EndDate:order.EndDate,
            Description:order.Description,
            Solution:order.Solution,
            Type: order.OrderType?.Name || 'N/A',
            StopReason: order.StopReason?.Reason || 'N/A',
            RepairStage: order.RepairStage?.Status || 'N/A'

        }
        ClinicalEngineer.findByPk(engineerId).then(engineer => {
            const Engineer ={
                Image:engineer.Image,
                FName:engineer.FName,
                LName:engineer.LName
            }
        res.render('workOrderDetails',{layout:'clinicalEngineerLayout',pageTitle:'Work Order',
                WO:true,order:order,Engineer,Engineer})
        })    
    }).catch(err => {
        res.render('error',{layout:false,pageTitle:'Error',href:'/',message:'Sorry !!! Could Not Get Work Orders'})

    })
}


//añadido 09/05/25
/*
exports.dashboard = async (req, res) => {
    try {
        const { year, department } = req.query;

        const where = {};
        if (year) where.InstallationDate = { [Op.between]: [`${year}-01-01`, `${year}-12-31`] };
        if (department) where.DepartmentCode = department;

        const equipments = await Equipment.findAll({ where });

        const totalEquipos = equipments.length;
        const costoTotal = equipments.reduce((sum, eq) => sum + (eq.Cost || 0), 0);

        const porAnio = {};
        const porEstado = {};
        const porActivo = { Activo: 0, Inactivo: 0 };

        equipments.forEach(eq => {
            const year = eq.InstallationDate.getFullYear();
            porAnio[year] = (porAnio[year] || 0) + 1;

            const status = eq.FuntionalStatus || 'Desconocido';
            porEstado[status] = (porEstado[status] || 0) + 1;

            eq.Active ? porActivo.Activo++ : porActivo.Inactivo++;
        });

        const anios = await Equipment.findAll({
            attributes: [[Sequelize.fn('DISTINCT', Sequelize.fn('YEAR', Sequelize.col('InstallationDate'))), 'year']],
            order: [[Sequelize.fn('YEAR', Sequelize.col('InstallationDate')), 'DESC']]
        });

        const departamentos = await Department.findAll();

        res.render('dashboard', {
            totalEquipos,
            costoTotal,
            porAnio: JSON.stringify(porAnio),
            porEstado: JSON.stringify(porEstado),
            porActivo: JSON.stringify(porActivo),
            anios: anios.map(a => a.dataValues.year),
            departamentos,
            selectedYear: year || '',
            selectedDept: department || '',
            pageTitle: 'Dashboard',
        });
    } catch (err) {
        console.error(err);
        res.render('error', { message: 'Error al cargar el dashboard' });
    }
};

*/
/*
exports.getDashboard = async (req, res) => {
    const selectedYear = req.query.year;  // Año seleccionado
    const selectedDept = req.query.department;  // Departamento seleccionado

    // Construir filtros de búsqueda
    const where = {};
    if (selectedYear) {
        where.InstallationDate = {
            [Op.between]: [`${selectedYear}-01-01`, `${selectedYear}-12-31`]
        };
    }
    if (selectedDept) {
        where.DepartmentCode = selectedDept;
    }

    try {
        // Obtener los equipos filtrados
        const equipos = await Equipment.findAll({
            where,
            attributes: ['FuntionalStatus', 'InstallationDate', 'Cost']
        });

        // Obtener todos los departamentos disponibles
        const departamentos = await Department.findAll();

        // Obtener todos los años disponibles desde la fecha de instalación
        const anios = [...new Set(equipos.map(e => new Date(e.InstallationDate).getFullYear()))].sort();

        // Crear indicadores de cantidad de equipos por estado funcional
        const indicadores = equipos.reduce((acc, equipo) => {
            const estado = equipo.FuntionalStatus || 'Desconocido';
            acc[estado] = (acc[estado] || 0) + 1;
            return acc;
        }, {});

        // Preparar los datos para el gráfico
        const chartData = {
            labels: Object.keys(indicadores),  // Estados funcionales
            values: Object.values(indicadores)  // Cantidad de equipos por estado
        };

        // Renderizar la vista con los datos
        res.render('dashboard', {
            departamentos,
            anios,
            selectedYear,
            selectedDept,
            chartData
        });
    } catch (err) {
        console.error('Error al obtener datos para el dashboard:', err);
        res.status(500).send('Error al obtener datos');
    }
};*/

const { Sequelize } = require('sequelize');
exports.home = async (req, res) => {
  try {
    const totalEquipos = await Equipment.count();
    const costoTotalRaw = await Equipment.sum('Cost');

    // Formatear costo total con coma como separador de miles y dos decimales
    const costoTotal = costoTotalRaw
      ? Number(costoTotalRaw).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 })
      : '0.00';

    const costosPorAnioRaw = await Equipment.findAll({
      attributes: [
        [Sequelize.fn('YEAR', Sequelize.col('InstallationDate')), 'anio'],
        [Sequelize.fn('SUM', Sequelize.col('Cost')), 'total']
      ],
      group: [Sequelize.fn('YEAR', Sequelize.col('InstallationDate'))],
      raw: true
    });

    // Formatear cada total por año con el mismo formato
    const costosPorAnio = costosPorAnioRaw.map(item => ({
      anio: item.anio,
      total: Number(item.total).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 })
    }));

    res.render('home', {
      totalEquipos,
      costoTotal,
      costosPorAnio
    });
  } catch (error) {
    console.error('Error en controlador home:', error);
    res.status(500).send('Error interno del servidor');
  }
};

/*exports.home = async (req, res) => {
  try {
    // Indicadores principales
    const totalEquipos = await Equipment.count();
    const costoTotal = await Equipment.sum('Cost');

    // Costos por año de instalación
    const costosPorAnio = await Equipment.findAll({
      attributes: [
        [Sequelize.fn('YEAR', Sequelize.col('InstallationDate')), 'anio'],
        [Sequelize.fn('SUM', Sequelize.col('Cost')), 'total']
      ],
      group: [Sequelize.fn('YEAR', Sequelize.col('InstallationDate'))],
      raw: true
    });

    res.render('home', {
      totalEquipos,
      costoTotal,
      costosPorAnio
    });
  } catch (error) {
    console.error('Error en controlador home:', error);
    res.status(500).send('Error interno del servidor');
  }
};*/

// Mostrar vista con modelos y preguntas
exports.getConfDayliQuestion = async (req, res) => {
  try {
    const search = req.query.search || '';

    const models = await Model.findAll({
      where: search ? {
        Model: {
          [require('sequelize').Op.like]: `%${search}%`
        }
      } : {}
    });

    res.render('confDayliQuestion', {
      models,
      search
    });
  } catch (error) {
    console.error(error);
    res.status(500).send('Error al cargar la configuración de preguntas diarias');
  }
};

exports.postConfDayliQuestion = async (req, res) => {
  try {
    const updates = req.body.models;

    for (const item of updates) {
      await Model.update({
        Q1: item.Q1,
        Q2: item.Q2,
        Q3: item.Q3,
        Q4: item.Q4,
        Q5: item.Q5
      }, {
        where: { id: item.id }
      });
    }

    res.redirect('/confDayliQuestion');
  } catch (error) {
    console.error(error);
    res.status(500).send('Error al actualizar las preguntas');
  }
};