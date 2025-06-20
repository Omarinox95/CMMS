const express = require('express');
const router = express.Router();
const addController=require('../controllers/add')
const { isLoggedIn, isAdmin, isClinicalEngineer } = require('../middlewares/auth');

router.post('/department/add',isLoggedIn, isAdmin,addController.addDepartment)
router.post('/agentSupplier/add',isLoggedIn, isAdmin,addController.addAgentSupplier)
router.post('/clinicalEngineer/add',isLoggedIn, isAdmin,addController.addClinicalEngineer)
router.post('/equipment/add',isLoggedIn, isAdmin,addController.addEquipment)
router.post('/sparePart/add',isLoggedIn, isAdmin,addController.addSpareParts)
router.post('/breakDown/add',isLoggedIn, isAdmin,addController.addBreakDown)
router.post('/workOrder/add',isLoggedIn, isAdmin,addController.addWorkOrder)
router.post('/maintenance/add',isLoggedIn, isAdmin,addController.addMaintenance)
router.post('/brand/add', isLoggedIn, isAdmin,addController.addBrand);
router.post('/model/add', isLoggedIn, isAdmin,addController.addModel);
router.post('/nameequipment/add',isLoggedIn, isAdmin, addController.addNameEquipment);
router.post('/stoporder/add', isLoggedIn, isAdmin,addController.addStopOrder);

router.post('/stopreason/add',isLoggedIn, isAdmin, addController.addStopReason);
router.post('/ordertype/add',isLoggedIn, isAdmin, addController.addOrderType);
router.post('/repairstage/add', isLoggedIn, isAdmin,addController.addRepairStage);
router.post('/receptionstatus/add', isLoggedIn, isAdmin,addController.addReceptionStatus);
router.post('/acquisitiontype/add', isLoggedIn, isAdmin,addController.addAcquisitionType);
router.post('/medicalStaff/add', isLoggedIn, isAdmin, addController.addMedicalStaff);

//router.get('/workOrder', isLoggedIn, isMedicalStaff, addController.getWorkOrders);
//router.post('/workOrder/add', isLoggedIn, isMedicalStaff, addController.postWorkOrder);


module.exports=router;