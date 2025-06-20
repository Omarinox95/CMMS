const express = require('express');
const router = express.Router();
const deleteController=require('../controllers/delete')
const { isLoggedIn, isAdmin, isClinicalEngineer } = require('../middlewares/auth');

router.get('/agentSupplier/delete/:id',deleteController.deleteAgentSupplier);
router.get('/clinicalEngineer/delete/:id',deleteController.deleteClinicalEngineer);
router.get('/equipment/delete/:id',deleteController.deleteEquipment);
router.get('/sparePart/delete/:id',deleteController.deleteSparePart);
router.get('/breakDown/delete/:id',deleteController.deleteBreakDown);
router.get('/workOrder/delete/:id',deleteController.deleteWorkOrder);
router.get('/maintenance/delete/:id',deleteController.deleteMaintenance);

router.get('/brand/delete/:id_brand', deleteController.deleteBrand);
router.post('/nameequipment/delete/:id_nameE', deleteController.deleteNameEquipment);
router.get('/stoporder/delete/:id', deleteController.deleteStopOrder);

module.exports=router;