// routes/equipment.js
/*const express = require('express');
const router = express.Router();
const searchController = require('../search/search');  // Asegúrate de la ruta correcta

// Ruta para la búsqueda de equipos
router.get('/search', searchController.searchEquipment);

module.exports = router;*/
// routes/equipmentRoutes.js
/*funcional 23:09
const express = require('express');
const router = express.Router();
const searchRouter = require('../search/search'); // Importa el router completo de search.js

// Usa el router de búsqueda como middleware
router.use('/', searchRouter);

module.exports = router;*/
const express = require('express');
const router = express.Router();
const searchController = require('../search/search'); // Asegúrate de que la ruta sea correcta

// Ruta para realizar la búsqueda
router.get('/search', searchController.searchEquipment);

module.exports = router;


