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

//añadido 03/03/25
const {SparePart} = require('../models');
router.get('/equipment', async (req, res) => {
    try {
        const spareParts = await SparePart.findAll(); // Obtiene todos los repuestos

        res.render('equipment', { spareParts }); // Enviar al frontend
    } catch (error) {
        console.error('Error al obtener los repuestos:', error);
        res.status(500).send('Error interno del servidor');
    }
});

//////////////////

// Ruta para realizar la búsqueda
router.get('/search', searchController.searchEquipment);



module.exports = router;


