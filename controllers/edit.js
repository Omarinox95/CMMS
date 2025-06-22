const AgentSupplier = require('../models/agent_supplier');
const ClinicalEngineer = require('../models/clinical_engineer');
const Equipment =require('../models/equipment')
const SparePart =require('../models/spare_part');
const BreakDown =require('../models/break_down');
const WorkOrder =require('../models/work_order');
const Maintenance =require('../models/maintenance');
const Category = require('../models/category');
const MedicalStaff = require('../models/medicalstaff'); // ✅ Asegúrate de que el path esté bien


const { StopReason, OrderType, StopOrder, ReceptionStatus, AcquisitionType, RepairStage, Brand, Model, NameEquipment } = require('../models');



exports.editAgentSupplier=(req,res)=>{
    id=req.params.id
    AgentSupplier.findByPk(id).then(agentSupplier =>{ 
        const as = {
              Name: agentSupplier.Name,
              Id: agentSupplier.Id,
              Adress: agentSupplier.Adress,
              Phone:agentSupplier.Phone,
              Email:agentSupplier.Email,
              Notes:agentSupplier.Notes
            }
    
        
    res.render('editAgentSupplier',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
                                     AS:true,agentSupplier:as});
 })
    .catch(err => res.render('error',{layout:false,pageTitle:'Error',href:'/agentSupplier',message:'Sorry !!! Could Not Get this Agent'}))
    
 
 
 }



exports.editClinicalEngineer=(req,res) => {
    dssn=req.params.id
    ClinicalEngineer.findOne({where:{DSSN:dssn}}).then(clinicalEngineer => { 
        const cs = {
              FName: clinicalEngineer.FName,
              LName: clinicalEngineer.LName,
              DSSN: clinicalEngineer.DSSN,
              Adress: clinicalEngineer.Adress,
              Phone:clinicalEngineer.Phone,
              WorkHours:clinicalEngineer.WorkHours,
              Email:clinicalEngineer.Email,
              Age:clinicalEngineer.Age,
              Image:clinicalEngineer.Image,
              role: clinicalEngineer.role
            }
    
    console.log(cs)    
    res.render('editClinicalEngineer',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
                                     CE:true,clinicalEngineer:cs});
 })
 .catch(err => 
   {
   console.log(err)
   res.render('error',{layout:false,pageTitle:'Error',href:'/agentSupplier',message:'Sorry !!! Could Not Get this Engineer'})
   })
 
 }

exports.editMedicalStaff = (req, res) => {
    const dssn = req.params.id;

    MedicalStaff.findByPk(dssn)
        .then(medicalStaff => {
            if (!medicalStaff) {
                return res.render('error', {
                    layout: false,
                    pageTitle: 'Error',
                    href: '/medicalStaff',
                    message: 'No se encontró al médico clínico con ese ID'
                });
            }

            const ms = {
                DSSN: medicalStaff.DSSN,
                FName: medicalStaff.FName,
                LName: medicalStaff.LName,
                Email: medicalStaff.Email,
                role: medicalStaff.role || 'medicalStaff' // valor por defecto si está vacío
            };

            res.render('editMedicalStaff', {
                layout: 'main-layout.handlebars',
                pageTitle: 'Editar Médico Clínico',
                medicalStaff: ms,
                MS: true // para activar el menú si lo usas
            });
        })
        .catch(err => {
            console.error(err);
            res.render('error', {
                layout: false,
                pageTitle: 'Error',
                href: '/medicalStaff',
                message: '¡Lo sentimos! No se pudo cargar el médico clínico'
            });
        });
};


 exports.editEquipment=(req,res)=>{
    code=req.params.id
    console.log("here")
    Equipment.findOne({where:{Code:code},include:[{model:Department}]}).then(equipment => {
        const eq = {
              Code: equipment.Code,
              Name: equipment.Name,
              Cost: equipment.Cost,
              InstallationDate: equipment.InstallationDate,
              WarrantyDate: equipment.WarrantyDate,
              ArrivalDate: equipment.InstallationDate,
              Model:equipment.Model,
              SerialNumber:equipment.SerialNumber,
              Manufacturer:equipment.Manufacturer,
              Location:equipment.Location,
              Notes:equipment.Notes,
              PM:equipment.PM,
              Image:equipment.Image,
              DepartmentCode:equipment.DepartmentCode,
              //añadido 02/03
              Software: equipment.Software,
              SoftwareVersion: equipment.SoftwareVersion,
              SoftwarePass: equipment.SoftwarePass,
              NetworkAddress: equipment.NetworkAddress,
              AssetStatus: equipment.AssetStatus,
              InsuranceStatus: equipment.InsuranceStatus,
              FuntionalStatus: equipment.FuntionalStatus,
              //
              AgentSupplierId:equipment.AgentSupplierId,
              OR:equipment.Department.Name =='OR' ? true : false,
              CSSD:equipment.Department.Name =='CSSD' ? true:false,
              ICU:equipment.Department.Name=='ICU' ? true:false,
              Radiology:equipment.Department.Name == 'Radiology' ? true:false
            }
            console.log("Datos recibidos en el backend:", eq);
   if(eq.PM =="Annualy"){
      res.render('editEquipment',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
                                       Equipment:true,equipment:eq,A:true});

   }else{
      res.render('editEquipment',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
            Equipment:true,equipment:eq,M:true});
   }     
   // res.render('editEquipment',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
   //                                    Equipment:true,equipment:eq});  
    
        
 })
    .catch(err => console.log("ERROR!!!!!!",err) )

 }


/*
 exports.editSparePart=(req,res)=>{
   code=req.params.id
   SparePart.findByPk(code,{include:[{model:Category}]}).then(sparePart =>{ 
       const sp = {
             Name: sparePart.Name,
             Code: sparePart.Code,
             Amount:sparePart.Amount,
             Image:sparePart.Image,
             AgentSupplierId:sparePart.AgentSupplierId,
             EquipmentCode:sparePart.EquipmentCode,
             CategoryId: sparePart.CategoryId
           }
       
   res.render('editSparePart',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
                                    SP:true,sparePart:sp});
})
   .catch(err => console.log("ERROR!!!!!!",err) )

}
*/
//añadido 03/03/25
exports.editSparePart = (req, res) => {
   const code = req.params.id;

   // Buscar el repuesto junto con la categoría y otras relaciones necesarias
   SparePart.findByPk(code, {
      include: [
         { model: AgentSupplier },   // Incluir Proveedor
         { model: Equipment },       // Incluir Equipo
         { model: Category }         // Incluir Categoría
      ]
   }).then(sparePart => {
      if (!sparePart) {
         return res.status(404).send('Repuesto no encontrado');
      }

      // Preparar los datos del repuesto
      const sp = {
         Id : sparePart.Id,
         Name: sparePart.Name,
         Code: sparePart.Code,
         Amount: sparePart.Amount,
         Image: sparePart.Image,
         AgentSupplierId: sparePart.AgentSupplierId,
         EquipmentCode: sparePart.EquipmentCode,
         CategoryId: sparePart.Category?.IdCat,  // Obtener el Id de la categoría
         CategoryName: sparePart.Category?.Name  // Obtener el nombre de la categoría
      };

      // Obtener todas las categorías disponibles para el formulario
      Category.findAll().then(categories => {
         const cat = categories.map(category => ({
            id: category.IdCat,
            name: category.Name
         }));

         // Renderizar la vista de edición, pasando los datos del repuesto y las categorías
         res.render('editSparePart', {
            layout: 'main-layout.handlebars',
            pageTitle: 'Editar Repuesto',
            SP: true,
            sparePart: sp,         // Datos del repuesto a editar
            categories: cat        // Lista de categorías disponibles
         });
      }).catch(err => {
         console.log("ERROR AL OBTENER CATEGORÍAS:", err);
         res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/home',
            message: 'No se pudo obtener las categorías'
         });
      });
   }).catch(err => {
      console.log("ERROR AL OBTENER EL REPUESO:", err);
      res.render('error', {
         layout: false,
         pageTitle: 'Error',
         href: '/home',
         message: 'No se pudo obtener el repuesto para editar.'
      });
   });
};

//
exports.editBreakDown=(req,res)=>{
   code=req.params.id
   BreakDown.findByPk(code).then(breakDown =>{ 
       const bd = {
         Code:breakDown.Code,
         Reason:breakDown.Reason,
         DATE:breakDown.DATE,
         EquipmentCode:breakDown.EquipmentCode
           }
   
       
   res.render('editBreakDown',{layout:'main-layout.handlebars' ,pageTitle:'Edit',
                                                   BreakDown:true,breakDown:bd});
})
   .catch(err => console.log("ERROR!!!!!!",err) )


}

/*exports.editWorkOrder=(req,res)=>{
   code = req.params.id
   WorkOrder.findByPk(code).then(workOrder=>{
      const wd = {
         Code:workOrder.Code,
         Cost:workOrder.Cost,
         StartDate:workOrder.StartDate,
         EndDate:workOrder.EndDate,
         Description:workOrder.Description,
         EquipmentCode:workOrder.EquipmentCode,
         Priority:workOrder.Priority,
         med:workOrder.Priority=='Medium'?true:false,
         high:workOrder.Priority=='High'?true:false,
         low:workOrder.Priority=='Low'?true:false,
         ClinicalEnginnerDSSN:workOrder.ClinicalEnginnerDSSN, 
         Solution:workOrder.Solution,
         Workdate:workOrder.Workdate

      }

   res.render('editWorkOrder',{layout:'main-layout.handlebars',pageTitle:'Edit',
                                       WO:true,workOrder:wd});



   })

     .catch(err=>console.log("errorrrrr",err))

}*/
exports.editWorkOrder = async (req, res) => {
  const code = req.params.id;

  try {
    const workOrder = await WorkOrder.findByPk(code);
    if (!workOrder) {
      return res.render('error', {
        layout: false,
        pageTitle: 'Error',
        href: '/workOrder',
        message: 'No se encontró la orden de trabajo',
      });
    }

    // Obtener datos para selects
    const [stopReasons, equipments, engineers, orderTypes, stopOrders, repairStages] = await Promise.all([
      StopReason.findAll(),
      Equipment.findAll(),
      ClinicalEngineer.findAll(),
      OrderType.findAll(),
      StopOrder.findAll(),
      RepairStage.findAll(),
    ]);

    const wd = {
      Code: workOrder.Code,
      Cost: workOrder.Cost,
      StartDate: workOrder.StartDate,
      EndDate: workOrder.EndDate,
      Description: workOrder.Description,
      EquipmentCode: workOrder.EquipmentCode,
      Priority: workOrder.Priority,
      med: workOrder.Priority == 'Medium',
      high: workOrder.Priority == 'High',
      low: workOrder.Priority == 'Low',
      ClinicalEngineerDSSN: workOrder.ClinicalEngineerDSSN,
      Solution: workOrder.Solution,
      Workdate: workOrder.Workdate,
      id_typeW: workOrder.id_typeW,
      id_StopReason: workOrder.id_StopReason,
      id_RepairStage: workOrder.id_RepairStage,
      id_StopOrder: workOrder.id_StopOrder,
    };

    res.render('editWorkOrder', {
      layout: 'main-layout.handlebars',
      pageTitle: 'Editar Orden de Trabajo',
      WO: true,
      workOrder: wd,
      StopReasons: stopReasons.map(r => r.toJSON()),
      Equipments: equipments.map(e => e.toJSON()),
      Engineers: engineers.map(e => e.toJSON()),
      OrderTypes: orderTypes.map(t => t.toJSON()),
      StopOrders: stopOrders.map(s => s.toJSON()),
      RepairStages: repairStages.map(r => r.toJSON()),
    });

  } catch (err) {
    console.error('Error al cargar la orden:', err);
    res.render('error', {
      layout: false,
      pageTitle: 'Error',
      href: '/workOrder',
      message: 'Error al cargar los datos para editar',
    });
  }
};

///
//primera etapa asignar tecnico
// POST: Asignar técnico a una orden
exports.assignTechnicianPost = async (req, res) => {
  const { code } = req.params;
  const { ClinicalEngineerDSSN } = req.body;

  try {
    // Validar que haya técnico
    if (!ClinicalEngineerDSSN) {
      return res.status(400).send("Debe seleccionar un técnico.");
    }

    // Actualizar la orden de trabajo
    await WorkOrder.update(
      {
        ClinicalEnginnerDSSN: ClinicalEngineerDSSN,
        id_RepairStage: 10 // pasa a etapa 10: asignada a técnico
      },
      { where: { Code: code } }
    );

    res.redirect("/workOrder/requests");
  } catch (error) {
    console.error("Error al asignar técnico:", error);
    res.status(500).send("Error al asignar técnico a la orden de trabajo.");
  }
};












/////
exports.editMaintenance=(req,res)=>{
   id = req.params.id
   Maintenance.findByPk(id).then(maintenance=>{
      const m = {
         Id:maintenance.Id,
         StartDate:maintenance.StartDate,
         EndDate:maintenance.EndDate,
         BreakDownCode:maintenance.BreakDownCode,
         Description:maintenance.Description,
         ClinicalEnginnerDSSN:maintenance.ClinicalEnginnerDSSN
         
      }

   res.render('editMaintenance',{layout:'main-layout.handlebars',pageTitle:'Edit',
                                       Maintenance:true,maintenance:m});



   })

     .catch(err=>console.log("errorrrrr",err))

}


exports.editNameEquipment = (req, res) => {
  const id = req.params.id;
  NameEquipment.findByPk(id).then(ne => {
    if (!ne) throw new Error('No encontrado');
    res.render('editNameEquipment', {
      layout: 'main-layout.handlebars',
      pageTitle: 'Editar Tipo de Equipo',
      nameEquipment: ne,
      NAMEEQUIPMENT: true
    });
  }).catch(err => res.render('error', {
    layout: false,
    pageTitle: 'Error',
    href: '/nameEquipment',
    message: 'No se pudo cargar el tipo de equipo'
  }));
};


exports.getEditBrand = async (req, res) => {
  try {
    const id = req.params.id_brand;  // debe ser exactamente el nombre que usas en la ruta
    const brand = await Brand.findByPk(id);
    console.log(brand);
    if (!brand) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Marca no encontrada',
        message: 'La marca que intentas editar no existe.'
      });
    }

    res.render('editBrand', {
      pageTitle: 'Editar Marca',
      brand: {
        id_brand: brand.id_brand,
        Brand: brand.Brand
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al cargar la marca.'
    });
  }
};

exports.postEditBrand = async (req, res) => {
  try {
    const id = req.params.id_brand;
    const { Brand: newName } = req.body;

    const brand = await Brand.findByPk(id);
    if (!brand) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Marca no encontrada',
        message: 'No se encontró la marca para actualizar.'
      });
    }

    brand.Brand = newName;
    await brand.save();

    res.redirect('/brand');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al actualizar la marca.'
    });
  }
};

exports.getEditModel = async (req, res) => {
  try {
    const id = req.params.model_id;

    const modelInstance = await Model.findByPk(id, {
      include: [{
        model: Brand,
        as: 'brand',
        attributes: ['id_brand', 'Brand']
      }]
    });

    if (!modelInstance) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Modelo no encontrado',
        message: 'El modelo que intentas editar no existe.'
      });
    }

    // Obtener todas las marcas como objetos planos
    const brandInstances = await Brand.findAll({ attributes: ['id_brand', 'Brand'] });
    const brands = brandInstances.map(brand => brand.get({ plain: true }));

    // Convertir modelo a objeto plano
    const model = modelInstance.get({ plain: true });

    res.render('editModel', {
      pageTitle: 'Editar Modelo',
      model: {
        id: model.id,
        Model: model.Model,
        id_brand: model.id_brand,
        Q1: model.Q1,
        Q2: model.Q2,
        Q3: model.Q3,
        Q4: model.Q4,
        Q5: model.Q5
      },
      brands
    });

  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al cargar el modelo.'
    });
  }
};

exports.postEditModel = async (req, res) => {
  try {
    const id = req.params.model_id;
    const { Model: modelName, id_brand, Q1, Q2, Q3, Q4, Q5 } = req.body;

    const model = await Model.findByPk(id);
    if (!model) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Modelo no encontrado',
        message: 'No se encontró el modelo para actualizar.'
      });
    }

    // Actualizar campos
    model.Model = modelName;
    model.id_brand = id_brand || null;
    model.Q1 = Q1;
    model.Q2 = Q2;
    model.Q3 = Q3;
    model.Q4 = Q4;
    model.Q5 = Q5;

    await model.save();

    res.redirect('/model');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al actualizar el modelo.'
    });
  }
};

exports.getEditNameequipment = async (req, res) => { 
  try {
    const id = req.params.id_nameE;

    const type = await NameEquipment.findByPk(id);
    if (!type) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Tipo de equipo no encontrado',
        message: 'El tipo de equipo que intentas editar no existe.'
      });
    }

    const typePlain = type.get({ plain: true });

    res.render('editNameequipment', {
      pageTitle: 'Editar Tipo de Equipo',
      type: typePlain
    });

  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al cargar el tipo de equipo.'
    });
  }
};

exports.postEditNameequipment = async (req, res) => {
  try {
    const id = req.params.id_nameE;
    // "function" es palabra reservada en JS, por eso renombramos aquí con "func"
    const { Name, function: func, aplication } = req.body;

    const type = await NameEquipment.findByPk(id);
    if (!type) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Tipo de equipo no encontrado',
        message: 'No se encontró el tipo de equipo para actualizar.'
      });
    }

    // Actualizar campos
    type.Name = Name;
    type.function = func;
    type.aplication = aplication;

    await type.save();

    res.redirect('/nameequipment'); // O la ruta que uses para listar
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al actualizar el tipo de equipo.'
    });
  }
};

exports.getEditStopOrder = async (req, res) => {
  try {
    const id = req.params.id;
    const stoporder = await StopOrder.findByPk(id);
    
    if (!stoporder) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Razón no encontrada',
        message: 'La razón que intentas editar no existe.',
      });
    }

    const stopPlain = stoporder.get({ plain: true });

    res.render('editStopOrder', {
      pageTitle: 'Editar Razón de Finalización',
      stoporder: stopPlain,
    });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al cargar la razón de finalización.',
    });
  }
};

exports.postEditStopOrder = async (req, res) => {
  try {
    const id = req.params.id;
    const { description, punctuation } = req.body;

    const stoporder = await StopOrder.findByPk(id);
    if (!stoporder) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Razón no encontrada',
        message: 'No se encontró la razón para actualizar.',
      });
    }

    stoporder.description = description;
    stoporder.punctuation = punctuation;
    await stoporder.save();

    res.redirect('/stoporder');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al actualizar la razón de finalización.',
    });
  }
};

exports.getEditStopReason = async (req, res) => {
  try {
    const id = req.params.id;
    const reason = await StopReason.findByPk(id);
    if (!reason) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Razón no encontrada', message: 'La razón no existe.' });
    }
    res.render('editStopReason', { pageTitle: 'Editar Razón de Creación', stopreason: reason.get({ plain: true }) });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al cargar la razón.' });
  }
};

exports.postEditStopReason = async (req, res) => {
  try {
    const id = req.params.id;
    const { Reason, punctuation } = req.body;
    const reason = await StopReason.findByPk(id);
    if (!reason) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Razón no encontrada', message: 'No se encontró la razón para actualizar.' });
    }
    reason.Reason = Reason;
    reason.punctuation = punctuation;
    await reason.save();
    res.redirect('/stopreason');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al actualizar la razón.' });
  }
};

// ---------------------------- ORDER TYPE ----------------------------
exports.getEditOrderType = async (req, res) => {
  try {
    const id = req.params.id;
    const type = await OrderType.findByPk(id);
    if (!type) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Tipo de Orden no encontrado', message: 'El tipo de orden no existe.' });
    }
    res.render('editOrderType', { pageTitle: 'Editar Tipo de Orden', ordertype: type.get({ plain: true }) });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al cargar el tipo de orden.' });
  }
};

exports.postEditOrderType = async (req, res) => {
  try {
    const id = req.params.id;
    const { Name } = req.body;
    const type = await OrderType.findByPk(id);
    if (!type) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Tipo de Orden no encontrado', message: 'No se encontró el tipo de orden para actualizar.' });
    }
    type.Name = Name;
    await type.save();
    res.redirect('/ordertype');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al actualizar el tipo de orden.' });
  }
};

// ---------------------------- REPAIR STAGE ----------------------------
exports.getEditRepairStage = async (req, res) => {
  try {
    const id = req.params.id;
    const stage = await RepairStage.findByPk(id);
    if (!stage) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Etapa de reparación no encontrada', message: 'No existe la etapa de reparación.' });
    }
    res.render('editRepairStage', { pageTitle: 'Editar Estado de Reparación', repairstage: stage.get({ plain: true }) });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al cargar el estado de reparación.' });
  }
};

exports.postEditRepairStage = async (req, res) => {
  try {
    const id = req.params.id;
    const { Status, FuntionalStatus } = req.body;
    const stage = await RepairStage.findByPk(id);
    if (!stage) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Etapa no encontrada', message: 'No se encontró la etapa para actualizar.' });
    }
    stage.Status = Status;
    stage.FuntionalStatus = FuntionalStatus;
    await stage.save();
    res.redirect('/repairstage');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al actualizar la etapa.' });
  }
};

// ---------------------------- RECEPTION STATUS ----------------------------
exports.getEditReceptionStatus = async (req, res) => {
  try {
    const id = req.params.id;
    const status = await ReceptionStatus.findByPk(id);
    if (!status) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Estado no encontrado', message: 'No existe el estado de recepción.' });
    }
    res.render('editReceptionStatus', { pageTitle: 'Editar Estado de Recepción', receptionstatus: status.get({ plain: true }) });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al cargar el estado de recepción.' });
  }
};

exports.postEditReceptionStatus = async (req, res) => {
  try {
    const id = req.params.id;
    const { Name } = req.body;
    const status = await ReceptionStatus.findByPk(id);
    if (!status) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Estado no encontrado', message: 'No se encontró el estado para actualizar.' });
    }
    status.Name = Name;
    await status.save();
    res.redirect('/receptionstatus');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al actualizar el estado.' });
  }
};

// ---------------------------- ACQUISITION TYPE ----------------------------
exports.getEditAcquisitionType = async (req, res) => {
  try {
    const id = req.params.id;
    const type = await AcquisitionType.findByPk(id);
    if (!type) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Tipo no encontrado', message: 'No existe el tipo de adquisición.' });
    }
    res.render('editAcquisitionType', { pageTitle: 'Editar Tipo de Adquisición', acquisitiontype: type.get({ plain: true }) });
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al cargar el tipo de adquisición.' });
  }
};

exports.postEditAcquisitionType = async (req, res) => {
  try {
    const id = req.params.id;
    const { Name } = req.body;
    const type = await AcquisitionType.findByPk(id);
    if (!type) {
      return res.status(404).render('error', { layout: false, pageTitle: 'Tipo no encontrado', message: 'No se encontró el tipo para actualizar.' });
    }
    type.Name = Name;
    await type.save();
    res.redirect('/acquisitiontype');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', { layout: false, pageTitle: 'Error', message: 'Error al actualizar el tipo.' });
  }
};

