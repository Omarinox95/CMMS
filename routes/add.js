const express = require('express');
const router = express.Router();
const addController=require('../controllers/add')

router.post('/department/add',addController.addDepartment)
router.post('/agentSupplier/add',addController.addAgentSupplier)
router.post('/clinicalEngineer/add',addController.addClinicalEngineer)
router.post('/equipment/add',addController.addEquipment)
router.post('/sparePart/add',addController.addSpareParts)
router.post('/breakDown/add',addController.addBreakDown)
router.post('/workOrder/add',addController.addWorkOrder)
router.post('/maintenance/add',addController.addMaintenance)
router.post('/brand/add', addController.addBrand);
router.post('/model/add', addController.addModel);
router.post('/nameequipment/add', addController.addNameEquipment);
router.post('/stoporder/add', addController.addStopOrder);

router.post('/stopreason/add', addController.addStopReason);
router.post('/ordertype/add', addController.addOrderType);
router.post('/repairstage/add', addController.addRepairStage);
router.post('/receptionstatus/add', addController.addReceptionStatus);
router.post('/acquisitiontype/add', addController.addAcquisitionType);

module.exports=router;