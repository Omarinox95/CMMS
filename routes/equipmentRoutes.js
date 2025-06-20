const express = require('express');
const router = express.Router();
const searchController = require('../search/search'); // Asegúrate de que la ruta sea correcta
const { isLoggedIn, isAdmin, isClinicalEngineer } = require('../middlewares/auth');
//añadido 03/03/25
//const {SparePart} = require('../models');
const { Agent, ReceptionStatus, AcquisitionType, SparePart } = require('../models');
//añadido 28/05
const { Nameequipment } = require('../models');
//05/06/25
/*const multer = require('multer');

const filestorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images');  // carpeta donde se guardarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, 'image_' + Date.now() + '_' + file.originalname); // nombre único
  },
});

const filefilter = (req, file, cb) => {
  if (
    file.mimetype === 'image/png' ||
    file.mimetype === 'image/jpg' ||
    file.mimetype === 'image/jpeg'
  ) {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const upload = multer({ storage: filestorage, fileFilter: filefilter });
const equipmentController = require('../controllers/add');

router.post('/equipment/add', upload.single('Image'), equipmentController.addEquipment);
*/
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
      const types = await Nameequipment.findAll();//añadido 28/05
      const agents = await Agent.findAll();
      const spareParts = await SparePart.findAll();
      const acquisitionTypes = await AcquisitionType.findAll();
      const receptionStatuses = await ReceptionStatus.findAll();
  
      console.log(acquisitionTypes);  // Para ver qué datos estás recibiendo
    console.log(receptionStatuses); // Lo mismo para receptionStatuses
    
      res.render('equipment', {
        Types: types,
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


