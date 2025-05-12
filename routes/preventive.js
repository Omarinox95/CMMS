// routes/preventive.js
const express = require('express');
const router = express.Router();
const preventiveController = require('../controllers/preventive');

// Obtener tareas como eventos
router.get('/ppm-events', preventiveController.getPPMEvents);

router.post('/complete/:code', preventiveController.completePPMTask);


// Generar tareas
router.post('/ppm-events/generate', preventiveController.generateTasks);

module.exports = router;
