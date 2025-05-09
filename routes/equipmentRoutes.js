const express = require('express');
const router = express.Router();
const searchController = require('../search/search'); // Asegúrate de que la ruta sea correcta

//añadido 03/03/25
//const {SparePart} = require('../models');
const { Agent, ReceptionStatus, AcquisitionType, SparePart } = require('../models');

/*router.get('/equipment', async (req, res) => {
    try {
        const agents = await Agent.findAll();
        const receptionStatusList = await ReceptionStatus.findAll();
        const acquisitionTypeList = await AcquisitionType.findAll();
        const spareParts = await SparePart.findAll();

        res.render('equipment', {
            Agents: agents,
            receptionStatusList: receptionStatusList,
            acquisitionTypeList: acquisitionTypeList,
            spareParts: spareParts
        });
    } catch (error) {
        console.error('Error al obtener los datos del formulario:', error);
        res.status(500).send('Error interno del servidor');
    }
});*/
router.get('/equipment', async (req, res) => {
    try {
      const agents = await Agent.findAll();
      const spareParts = await SparePart.findAll();
      const acquisitionTypes = await AcquisitionType.findAll();
      const receptionStatuses = await ReceptionStatus.findAll();
  
      console.log(acquisitionTypes);  // Para ver qué datos estás recibiendo
    console.log(receptionStatuses); // Lo mismo para receptionStatuses
    
      res.render('equipment', {
        Agents:agents,
        spareParts: spareParts,
        acquisitionTypes: acquisitionTypes, 
        receptionStatuses: receptionStatuses });
    } catch (error) {
      console.error('Error en /equipment:', error);
      res.status(500).send('Error interno del servidor');
    }
  });
  

//////////////////

// Ruta para realizar la búsqueda
router.get('/search', searchController.searchEquipment);



module.exports = router;


