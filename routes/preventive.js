// routes/preventive.js
const express = require('express');
const router = express.Router();
const preventiveController = require('../controllers/preventive');

// Obtener tareas como eventos
router.get('/api/ppm-events', preventiveController.getPPMEvents);
// Calendario para clínico
router.get('/clinical/calendar', preventiveController.renderClinicalCalendar);
/*router.get('/clinical/calendar', (req, res) => {
  res.render('clinical_ppm_calendar', { layout: 'clinicalEngineerLayout' }); // si usas Handlebars
});*/

router.post('/complete/:code', preventiveController.completePPMTask);


// Generar tareas
router.post('/ppm-events/generate', preventiveController.generateTasks);

module.exports = router;
