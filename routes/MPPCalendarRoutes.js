// routes/MPPCalendarRoutes.js
/*
const express = require('express');
const router = express.Router();
const MPPCalendarController = require('../controllers/MPPCalendar');

// Ruta para ver el calendario de mantenimientos preventivos
router.get('/engineer/ppm/calendar', MPPCalendarController.ppmCalendar);

// Ruta para ver los detalles de un mantenimiento preventivo
router.get('/engineer/ppm/:code', MPPCalendarController.ppmDetails);

module.exports = router;
*/
// routes/MPPCalendarRoutes.js


//////
/*
const express = require('express');
const router = express.Router();
const MPPCalendarController = require('../controllers/MPPCalendar');

// Ruta para ver el calendario de mantenimientos preventivos
router.get('/engineer/ppm/calendar', MPPCalendarController.ppmCalendar);
// Ruta para ver los detalles de un mantenimiento preventivo
router.get('/engineer/ppm/:code', MPPCalendarController.ppmDetails);
module.exports = router;
*/

/*FUNCIONA HASTA 15:50
// Ruta para ver el calendario de mantenimiento preventivo
router.get('/engineer/preventiveMaintenance', MPPCalendarController.ppmCalendar);

// Ruta para ver los detalles de un mantenimiento preventivo específico
router.get('/engineer/ppm/:code', MPPCalendarController.ppmDetails);

module.exports = router;
*/
//AUMENTADO 15:51 12/11
/*
const express = require('express');
const router = express.Router();
const MPPCalendarController = require('../controllers/MPPCalendar');

router.get('/calendar', MPPCalendarController.ppmCalendar); // Calendario principal de PPM
router.get('/calendar/ppm/:code', MPPCalendarController.ppmDetails); // Detalles de un PPM específico

module.exports = router;*/