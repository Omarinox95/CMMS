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

////////////INICIO DE RFID//////////////////
/*const mqtt = require('mqtt');
const clientId = 'mqttjs_' + Math.random().toString(16).substr(2, 8);
const host = 'ws://broker.emqx.io:8083/mqtt';

const options = {
  keepalive: 60,
  clientId: clientId,
  protocolId: 'MQTT',
  protocolVersion: 4,
  clean: true,
  reconnectPeriod: 1000,
  connectTimeout: 30 * 1000,
  will: {
    topic: 'WillMsg',
    payload: 'Connection Closed abnormally..!',
    qos: 0,
    retain: false,
  },
};

console.log('Connecting mqtt client');
const client = mqtt.connect(host, options);

/////////

client.on('error', (err) => {
  console.log('Connection error: ', err);
  client.end();
});

client.on('reconnect', () => {
  console.log('Reconnecting...');
});*/

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

// Controllers
app.use(reportController);
app.use(editController);
app.use(deleteController);
app.use(addController);
app.use(homeController);
app.use(emqxController);

/////////////////////////////////////FUNCIONAMIENTO DE ESCRITURA Y LECTURA DE RFID/////////////

/*app.get('/rfidEquipo', (req, res) => {
  res.writeHead(200, {'Content-Type': 'application/json'})
  console.log("el id del equipo es: "+ rfid2);
  res.end(JSON.stringify(rfid2));
})

app.get('/confirmacion', (req, res) => {
  res.writeHead(200, {'Content-Type': 'application/json'})
  console.log("el estado es: "+ estado);
  res.end(JSON.stringify(estado));
})
*/
/////////////////////////////

// 404 error page
app.use((req, res) => {
  res.status(404).render('error', { layout: false, href: '/', pageTitle: '404 Error', message: '404 Sorry !!! Could Not Get This Page' });
});

// Model Associations
ppm_questions.belongsTo(equipment, { foreignKey: 'EquipmentCode' });
equipment.hasOne(ppm_questions, { foreignKey: 'EquipmentCode' });
clinical_engineer.belongsTo(department);
department.hasMany(clinical_engineer);
work_order.belongsTo(clinical_engineer);
clinical_engineer.hasMany(work_order);
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
dialy_inspection.belongsTo(clinical_engineer);
clinical_engineer.hasMany(dialy_inspection);
ppm.belongsTo(equipment);
equipment.hasMany(ppm);
ppm.belongsTo(clinical_engineer);
clinical_engineer.hasMany(ppm);
maintenance.belongsTo(clinical_engineer);
clinical_engineer.hasMany(maintenance);
spare_parts.belongsTo(equipment);
equipment.hasMany(spare_parts);

///////////////////////////////////////RFID FUNCTIONS///////////////////////////////////////////////
/*client.on('connect', () => {
  console.log('Cliente conectado');

  client.subscribe('esp32/rfid', () => {
    client.on('message', (topic, rfid) => {
      console.log(`Received '${rfid}' on '${topic}'`);
      const d = new Date();
      d.setHours(d.getHours() - 4);
      const fecha = d.toISOString().replace('T', ' ').substr(0, 19);

      if (rfid.toString().startsWith('s')) {
        const rfidReal = rfid.toString().substr(1);
        if (/^\d+$/.test(rfidReal)) {
          mySQL.query(`UPDATE rfid SET fecha_salida = '${fecha}' WHERE pac = ${rfidReal} AND fecha_salida IS NULL`, (err, result) => {
            if (err) console.log(err);
            else console.log(result);
          });
        }
      } else if (rfid.toString().startsWith('e')) {
        const rfidReal = rfid.toString().substr(1);
        if (/^\d+$/.test(rfidReal)) {
          mySQL.query(`INSERT INTO rfid(pac, fecha_entrada) VALUES ('${rfidReal}', '${fecha}')`, (err, result) => {
            if (err) console.log(err);
            else console.log(result);
          });
        }
      }
    });
  });

  client.subscribe('esp32/conf', () => {
    client.on('message', (topic, est) => {
      console.log(`Received '${est}' on '${topic}'`);
      let estado;
      if (est.toString() === 'si') {
        estado = 'Tag detectado, prosiga con el registro';
      } else if (est.toString() === 'no') {
        estado = 'Tag no detectado, revise que se encuentre en el grabador';
      }
      console.log(estado);
    });
  });

  client.subscribe('lecturaEquipo', () => {
    client.on('message', (topic, rf) => {
      console.log(`Received '${rf}' on '${topic}'`);
      const rfid2 = parseInt(rf, 10);
      console.log(rfid2);
    });
  });
});
*/
//////////////////////////////////////////////////////////////////////////////////////////


// Synchronizing with database 
sequelize.sync()
  // .sync({force: true}) // Uncomment this line only if you want to drop and recreate tables
  .then(() => {
    app.listen(3000, () => {
      console.log('Running on port 3000');
    });
  })
  .catch((err) => {
    console.log('Error:', err);
  });
