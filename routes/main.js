const DirName=require('../util/path');
const express = require('express');
const router = express.Router();
const homeController=require('../controllers/home')

//añadido 11/05
const preventiveController = require('../controllers/preventive');

// Ver calendario preventivo
router.get('/engineer/ppm/calendar', preventiveController.renderCalendar);

const Model = require('../models/model');



// app.get('/addDepartment',controller.addDepartment);
router.get('/department',homeController.department);
router.get('/breakdown',homeController.breakDown)
router.get('/equipment',homeController.equipment)
router.get('/workOrder',homeController.workOrder)
router.get('/agentSupplier',homeController.agentSupplier)
router.get('/sparePart',homeController.sparePart)
router.get('/clinicalEngineer',homeController.clinicalEngineer)
router.get('/maintenance',homeController.maintenance)
router.get('/installation',homeController.installation)
router.get('/ppm',homeController.ppm)
router.get('/dialyInspection',homeController.dailyInspection)
router.get('/home',homeController.home)
router.get('/engineer/dialyInspection',homeController.dialyInspectionEngineer)
router.post('/engineer/dialyInspection',homeController.dialyInspectionEngineerPost)
router.get('/engineer/ppm',homeController.ppmEngineer)
router.post('/engineer/ppm/equipment',homeController.ppmEngineerPost)
router.post('/engineer/ppmEquipment/:Code',homeController.ppmEngineerEquipmentPost)
router.get('/engineer/workOrder',homeController.workorder)
router.get('/engineer/workOrder/description/:code',homeController.workorderDescription)
router.get('/engineer/ppm/:code',homeController.ppmEngineerEquipment)
router.post('/signIn',homeController.signIn);
router.get('/',homeController.homeSignIn);

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

router.get('/brand', homeController.brand); // o como se llame tu controlador
router.get('/model', homeController.model);
router.get('/nameequipment', homeController.nameequipment);
router.get('/stoporder', homeController.stoporder);
router.get('/stopreason', homeController.stopreason);
router.get('/ordertype', homeController.ordertype);
router.get('/repairstage', homeController.repairstage);
router.get('/receptionstatus', homeController.receptionstatus);
router.get('/acquisitiontype', homeController.acquisitiontype);
module.exports=router;