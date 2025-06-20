const DirName=require('../util/path');
const express = require('express');
const router = express.Router();
const homeController=require('../controllers/home')
const { isLoggedIn, isAdmin, isClinicalEngineer, isMedicalStaff  } = require('../middlewares/auth');
//añadido 11/05
const preventiveController = require('../controllers/preventive');
const Model = require('../models/model');

router.post('/signIn',homeController.signIn);
router.get('/',homeController.homeSignIn);

// app.get('/addDepartment',controller.addDepartment);
router.get('/department',isLoggedIn, isAdmin,homeController.department);
router.get('/breakdown',isLoggedIn, isAdmin,homeController.breakDown)
router.get('/equipment',isLoggedIn, isAdmin,homeController.equipment)
router.get('/workOrder',isLoggedIn, isAdmin,homeController.workOrder)
router.get('/agentSupplier',isLoggedIn, isAdmin,homeController.agentSupplier)
router.get('/sparePart',isLoggedIn, isAdmin,homeController.sparePart)
router.get('/clinicalEngineer',isLoggedIn, isAdmin,homeController.clinicalEngineer)
router.get('/maintenance',isLoggedIn, isAdmin,homeController.maintenance)
router.get('/installation',isLoggedIn, isAdmin,homeController.installation)
router.get('/ppm',isLoggedIn, isAdmin,homeController.ppm)
router.get('/dialyInspection',isLoggedIn, isAdmin,homeController.dailyInspection)
//router.get('/home',homeController.home)
router.get('/home', isLoggedIn, isAdmin, homeController.home);
router.get('/engineer/dialyInspection', isLoggedIn, isClinicalEngineer, homeController.dialyInspectionEngineer);
router.post('/engineer/dialyInspection', isLoggedIn, isClinicalEngineer, homeController.dialyInspectionEngineerPost);
//router.get('/engineer/dialyInspection',homeController.dialyInspectionEngineer)
//router.post('/engineer/dialyInspection',homeController.dialyInspectionEngineerPost)
router.get('/engineer/ppm',isLoggedIn, isClinicalEngineer,homeController.ppmEngineer)
router.post('/engineer/ppm/equipment',isLoggedIn, isClinicalEngineer,homeController.ppmEngineerPost)
router.post('/engineer/ppmEquipment/:Code',isLoggedIn, isClinicalEngineer,homeController.ppmEngineerEquipmentPost)
router.get('/engineer/workOrder', isLoggedIn, isClinicalEngineer,homeController.workorder)
router.get('/engineer/workOrder/description/:code',isLoggedIn, isClinicalEngineer,homeController.workorderDescription)
router.get('/engineer/ppm/:code',isLoggedIn, isClinicalEngineer,homeController.ppmEngineerEquipment)
router.get('/medicalStaff', isLoggedIn, isAdmin, homeController.medicalStaff);
// Ver calendario preventivo
router.get('/engineer/ppm/calendar',isLoggedIn, isClinicalEngineer, preventiveController.renderCalendar);
router.get('/home', isLoggedIn, isMedicalStaff, homeController.medicalStaffHome);
router.get('/medicalStaff/workOrder', homeController.getMedicalStaffWorkOrders);
router.post('/medicalStaff/workOrder/add', homeController.postMedicalStaffWorkOrder);

// GET para renderizar el formulario
router.get('/confDayliQuestion', async (req, res) => {
  try {
    const modelos = await Model.findAll({ raw: true });
    res.render('confDayliQuestion', { modelos });
  } catch (err) {
    res.status(500).send('Error al obtener modelos');
  }
});

// GET para traer datos de un modelo por ID (AJAX)
router.get('/confDayliQuestion/:id', async (req, res) => {
  try {
    const modelo = await Model.findByPk(req.params.id, { raw: true });
    res.json(modelo);
  } catch (err) {
    res.status(500).json({ error: 'Error al obtener modelo' });
  }
});

// POST para actualizar preguntas
router.post('/confDayliQuestion/update/:id', async (req, res) => {
  try {
    const { Q1, Q2, Q3, Q4, Q5 } = req.body;
    await Model.update({ Q1, Q2, Q3, Q4, Q5 }, { where: { id: req.params.id } });
    res.redirect('/confDayliQuestion');
  } catch (err) {
    res.status(500).send('Error al actualizar');
  }
});

router.get('/api/model-questions/:modelId', async (req, res) => {
  try {
    const model = await Model.findByPk(req.params.modelId);
    if (!model) {
      return res.status(404).json({ error: 'Modelo no encontrado' });
    }
    res.json({
      Q1: model.Q1,
      Q2: model.Q2,
      Q3: model.Q3,
      Q4: model.Q4,
      Q5: model.Q5
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno al obtener preguntas' });
  }
});

router.get('/brand',isLoggedIn, isAdmin, homeController.brand); // o como se llame tu controlador
router.get('/model',isLoggedIn, isAdmin, homeController.model);
router.get('/nameequipment',isLoggedIn, isAdmin, homeController.nameequipment);
router.get('/stoporder',isLoggedIn, isAdmin, homeController.stoporder);
router.get('/stopreason',isLoggedIn, isAdmin, homeController.stopreason);
router.get('/ordertype',isLoggedIn, isAdmin, homeController.ordertype);
router.get('/repairstage',isLoggedIn, isAdmin, homeController.repairstage);
router.get('/receptionstatus',isLoggedIn, isAdmin, homeController.receptionstatus);
router.get('/acquisitiontype',isLoggedIn, isAdmin, homeController.acquisitiontype);
module.exports=router;