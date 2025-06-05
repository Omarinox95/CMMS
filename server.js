const express = require('express');
const path = require('path');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const multer = require('multer');
const DirName = require('./util/path');
const sequelize = require('./util/db');
const session = require('express-session');
const clinical_engineer = require('./models/clinical_engineer');
const spare_parts = require('./models/spare_part');
const department = require('./models/department');
const agent_supplier = require('./models/agent_supplier');
const equipment = require('./models/equipment');
const work_order = require('./models/work_order');
const break_down = require('./models/break_down');
const dialy_inspection = require('./models/dialy_inspection');
const ppm_questions = require('./models/ppm_questions');
const ppm = require('./models/ppm');
const maintenance = require('./models/maintenance');
const homeController = require('./routes/main');
const addController = require('./routes/add');
const deleteController = require('./routes/delete');
const editController = require('./routes/edit');
const reportController = require('./routes/report');
const emqxController = require('./emqx/emqx-request');
const searchController = require('./search/search');
const equipmentRoutes = require('./routes/equipmentRoutes');
const equipmentsparepart = require('./models/equipmentsparepart');
const { Equipment, Department } = require('./models'); // Importa los modelos desde index.js

//añadido 06/05/25
const ReceptionStatus = require('./models/ReceptionStatus');
const AcquisitionType = require('./models/AcquisitionType');

///AUMENTADO PARA MP
const preventiveRoutes = require('./routes/preventive');

//aumentoado para mejorar GE
const { NameEquipment, Model } = require('./models');

//aumentado para marcas
const brandRoutes = require('./routes/brandRoutes');

//aumentado para actualizar GE 1 vez al dia
// Ejecutar todos los días a las 06:30 a.m.
const cron = require('node-cron');
const actualizarFRecordYGE = require('./util/actualizarFRecordYGE');

cron.schedule('30 6 * * *', () => {
  console.log('⏰ Ejecutando actualización diaria de F_record y GE...');
  actualizarFRecordYGE();
});

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({ secret: 'anysecret', resave: false, saveUninitialized: false }));

const filestorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images');
  },
  filename: (req, file, cb) => {
    cb(null, 'image_' + file.originalname);
  },
});

const filefilter = (req, file, cb) => {
  if (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg') {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

app.use(multer({ storage: filestorage, fileFilter: filefilter }).single('image'));

app.use(express.static(path.join(__dirname, 'public')));
app.engine('handlebars', exphbs({ layoutsDir: 'views/layouts/', defaultLayout: 'main-layout', partialsDir: 'views/includes/' }));
app.set('view engine', 'handlebars');
app.set('views', 'views');

// aumentado 09/05 indicadores

///

//aumentado para PM
app.use('/api', preventiveRoutes); // Las rutas se usarán con /api/ppm-events

//aumentado para marcas
app.use('/brands', brandRoutes);

app.set('view engine', 'handlebars');
// Controllers
app.use(reportController);
app.use(editController);
app.use(deleteController);
app.use(addController);
app.use(homeController);
app.use(emqxController);
app.use('/equipment', equipmentRoutes);
//app.use(searchController);
//app.use(MPPCalendarRoutes);


// 404 error page
app.use((req, res) => {
  res.status(404).render('error', { layout: false, href: '/', pageTitle: '404 Error', message: '404 Sorry !!! Could Not Get This Page' });
});

// Model Associations
ppm_questions.belongsTo(equipment, { foreignKey: 'EquipmentCode' });
equipment.hasOne(ppm_questions, { foreignKey: 'EquipmentCode' });
//clinical_engineer.belongsTo(department);
//department.hasMany(clinical_engineer);
//work_order.belongsTo(clinical_engineer);
//clinical_engineer.hasMany(work_order);
work_order.belongsTo(clinical_engineer, {
  foreignKey: 'ClinicalEnginnerDSSN',   // debe coincidir con tu modelo
  targetKey: 'DSSN',
});

clinical_engineer.hasMany(work_order, {
  foreignKey: 'ClinicalEnginnerDSSN',
  sourceKey: 'DSSN',
});
spare_parts.belongsTo(agent_supplier);
agent_supplier.hasMany(spare_parts);
equipment.belongsTo(agent_supplier);
agent_supplier.hasMany(equipment);
equipment.belongsTo(department);
department.hasMany(equipment);
work_order.belongsTo(equipment);
equipment.hasMany(work_order);
break_down.belongsTo(equipment);
equipment.hasMany(break_down);
maintenance.belongsTo(break_down);
break_down.hasMany(maintenance);
dialy_inspection.belongsTo(equipment);
equipment.hasMany(dialy_inspection);
//dialy_inspection.belongsTo(clinical_engineer);
//clinical_engineer.hasMany(dialy_inspection);
dialy_inspection.belongsTo(clinical_engineer, {
  foreignKey: 'ClinicalEnginnerDSSN',
  targetKey: 'DSSN'
});
clinical_engineer.hasMany(dialy_inspection, {
  foreignKey: 'ClinicalEnginnerDSSN',
  sourceKey: 'DSSN'
});

ppm.belongsTo(equipment);
equipment.hasMany(ppm);
//ppm.belongsTo(clinical_engineer);
//clinical_engineer.hasMany(ppm);
//maintenance.belongsTo(clinical_engineer);
//clinical_engineer.hasMany(maintenance);
ppm.belongsTo(clinical_engineer, {
  foreignKey: 'ClinicalEnginnerDSSN',
  targetKey: 'DSSN'
});
clinical_engineer.hasMany(ppm, {
  foreignKey: 'ClinicalEnginnerDSSN',
  sourceKey: 'DSSN'
});

// Relación con Maintenance
maintenance.belongsTo(clinical_engineer, {
  foreignKey: 'ClinicalEnginnerDSSN',
  targetKey: 'DSSN'
});
clinical_engineer.hasMany(maintenance, {
  foreignKey: 'ClinicalEnginnerDSSN',
  sourceKey: 'DSSN'
});
//spare_parts.belongsTo(equipment);
//equipment.hasMany(spare_parts);
equipment.belongsToMany(spare_parts, { through: 'equipmentsparepart', foreignKey: 'id_equipment' });
spare_parts.belongsToMany(equipment, { through: 'equipmentsparepart', foreignKey: 'id_sparepart' });


//aumentado 06/05/25
equipment.belongsTo(ReceptionStatus, { foreignKey: 'ReceptionStatusId' });
ReceptionStatus.hasMany(equipment, { foreignKey: 'ReceptionStatusId' });

equipment.belongsTo(AcquisitionType, { foreignKey: 'AcquisitionTypeId' });
AcquisitionType.hasMany(equipment, { foreignKey: 'AcquisitionTypeId' });




// Synchronizing with database 
sequelize.sync()
  // .sync({force: true}) // Uncomment this line only if you want to drop and recreate tables
  .then(() => {
    console.log('Sincronizado correctamente');
    app.listen(3000, () => {
      console.log('Running on port 3000');
    });
  })
  .catch((err) => {
    console.log('Error:', err);
  });
