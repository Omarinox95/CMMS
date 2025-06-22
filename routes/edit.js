const express = require('express');
const router = express.Router();
const editController=require('../controllers/edit')
const { isLoggedIn, isAdmin, isClinicalEngineer } = require('../middlewares/auth');

router.get('/agentSupplier/edit/:id',editController.editAgentSupplier);
router.get('/clinicalEngineer/edit/:id',editController.editClinicalEngineer);
router.get('/equipment/edit/:id',editController.editEquipment);
router.get('/sparePart/edit/:id',editController.editSparePart);
router.get('/breakDown/edit/:id',editController.editBreakDown);
router.get('/workOrder/edit/:id',editController.editWorkOrder);
router.get('/maintenance/edit/:id',editController.editMaintenance);
router.get('/brand/edit/:id_brand', editController.getEditBrand); // formulario editar
router.post('/brand/edit/:id_brand', editController.postEditBrand); // actualizar marca
router.get('/model/edit/:model_id', editController.getEditModel); // formulario editar
router.post('/model/edit/:model_id', editController.postEditModel);
router.get('/nameequipment/edit/:id_nameE', editController.getEditNameequipment);
router.post('/nameequipment/edit/:id_nameE', editController.postEditNameequipment);
router.get('/stoporder/edit/:id', editController.getEditStopOrder);
router.post('/stoporder/edit/:id', editController.postEditStopOrder);
router.get('/medicalStaff/edit/:id', editController.editMedicalStaff);

router.get('/stopreason/edit/:id', editController.getEditStopReason);
router.post('/stopreason/edit/:id', editController.postEditStopReason);
router.get('/ordertype/edit/:id', editController.getEditOrderType);
router.post('/ordertype/edit/:id', editController.postEditOrderType);
router.get('/repairstage/edit/:id', editController.getEditRepairStage);
router.post('/repairstage/edit/:id', editController.postEditRepairStage);
router.get('/receptionstatus/edit/:id', editController.getEditReceptionStatus);
router.post('/receptionstatus/edit/:id', editController.postEditReceptionStatus);
router.get('/acquisitiontype/edit/:id', editController.getEditAcquisitionType);
router.post('/acquisitiontype/edit/:id', editController.postEditAcquisitionType);


///etapa asignar tecnico
router.post("/workOrder/asignar/:code", editController.assignTechnicianPost);


module.exports=router;