const AgentSupplier = require('../models/agent_supplier')
const ClinicalEngineer=require('../models/clinical_engineer')
const Equipment =require('../models/equipment')
const SparePart=require('../models/spare_part')
const BreakDown=require('../models/break_down')
const WorkOrder=require('../models/work_order')
const Maintenance = require('../models/maintenance')

const { StopReason, OrderType, StopOrder, RepairStage, Brand, NameEquipment } = require('../models');

exports.deleteAgentSupplier=(req,res)=>{
    id=req.params.id
    AgentSupplier.findByPk(id).then(agentSupplier =>{ 
     agentSupplier.destroy().then(res.redirect('/agentSupplier'))
     
 })
     .catch(err => console.log("ERROR!!!!!!",err) )
 
 
 }


 exports.deleteClinicalEngineer=(req,res)=>{
    dssn=req.params.id
    ClinicalEngineer.findByPk(dssn).then(clinicalEngineer =>{ 
     clinicalEngineer.destroy().then( res.redirect('/clinicalEngineer'))
    
 })
    .catch(err => console.log("ERROR!!!!!!",err) )
 
 
 }


 exports.deleteEquipment=(req,res)=>{
    code=req.params.id
    Equipment.findByPk(code).then(equipment =>{ 
     equipment.destroy().then(res.redirect('/equipment'))
     
 })
    .catch(err => console.log("ERROR!!!!!!",err) )
 }

 exports.deleteSparePart=(req,res)=>{
    code=req.params.id
    SparePart.findByPk(code).then(sparepart=>{ 
    sparepart.destroy().then(res.redirect('/sparePart'))
        
 })
    .catch(err => console.log("ERROR!!!!!!",err) )
 }


 exports.deleteBreakDown=(req,res)=>{
    code=req.params.id
    BreakDown.findByPk(code).then(breakdown=>{ 
    console.log(code)
     breakdown.destroy().then(res.redirect('/breakDown'))
     
 })
    .catch(err => console.log("ERROR!!!!!!",err) )
 }

 exports.deleteWorkOrder=(req,res)=>{
    code=req.params.id
    WorkOrder.findByPk(code).then(workorder=>{ 
    console.log(code)
     workorder.destroy().then( res.redirect('/workOrder'))
    
 })
    .catch(err => console.log("ERROR!!!!!!",err) )
 }

 exports.deleteMaintenance=(req,res)=>{
   code=req.params.id
   Maintenance.findByPk(code).then(maintenance=>{ 
   console.log(code)
    maintenance.destroy().then( res.redirect('/maintenance'))
   
})
   .catch(err => console.log("ERROR!!!!!!",err) )
}


exports.deleteModel = (req, res) => {
    const id = req.params.id;

    Model.findByPk(id).then(model => {
        if (model) return model.destroy();
    }).then(() => res.redirect('/model'))
      .catch(err => console.log("ERROR AL ELIMINAR MODELO", err));
};


exports.deleteStopOrder = (req, res) => {
  StopOrder.findByPk(req.params.id).then(so => so && so.destroy())
    .then(() => res.redirect('/stopOrder'))
    .catch(err => console.log("ERROR AL ELIMINAR STOPORDER", err));
};


exports.deleteBrand = async (req, res) => {
  try {
    const id = req.params.id_brand;

    const brand = await Brand.findByPk(id);
    if (!brand) {
      return res.status(404).render('error', {
        layout: false,
        pageTitle: 'Marca no encontrada',
        message: 'No se encontró la marca para eliminar.'
      });
    }

    await brand.destroy();

    res.redirect('/brand');
  } catch (error) {
    console.error(error);
    res.status(500).render('error', {
      layout: false,
      pageTitle: 'Error',
      message: 'Error al eliminar la marca.'
    });
  }
};

exports.deleteNameEquipment = async (req, res) => {
  const id = req.params.id_nameE; // toma el id desde params

  try {
    const deleted = await NameEquipment.destroy({
      where: { id_nameE: id }
    });

    if (deleted) {
      res.redirect('/nameequipment');
    } else {
      res.status(404).send('Tipo de equipo no encontrado');
    }
  } catch (error) {
    console.error('Error al eliminar:', error);
    res.status(500).send('Error interno del servidor');
  }
};

exports.deleteStopOrder = async (req, res) => {
  const id = req.params.id;
  try {
    await StopOrder.destroy({ where: { id } });
    res.redirect('/stoporder');
  } catch (err) {
    console.error(err);
    res.render('error', {
      layout: false,
      pageTitle: 'Error',
      href: '/stoporder',
      message: 'No se pudo eliminar la razón de finalización.'
    });
  }
};
