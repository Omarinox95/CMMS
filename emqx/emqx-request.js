const express = require('express');
const router = express.Router();
//const mqtt = require('mqtt');
const client = require('../emqx/emqx-connection');
const TagNotification = require('../models/tagnotification');

//aumentado
const Equipment = require('../models/equipment');

////////////INICIO DE RFID//////////////////

/*const clientId = 'mqttjs_' + Math.random().toString(16).substr(2, 8);
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

client.on('error', (err) => {
  console.log('Connection error: ', err);
  client.end();
});

client.on('reconnect', () => {
  console.log('Reconnecting...');
});

client.on('connect', () => {
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

  
    client.subscribe('lecturaEquipo', () => {
      client.on('message', (topic, rf) => {
        console.log(`Received '${rf}' on '${topic}'`);
        const rfid2 = parseInt(rf, 10);
        console.log(rfid2);
      });
    });
  });*/
  
router.post('/tagstopicsubscribe', (req, res) => {
  res.writeHead(200, {'Content-Type': 'application/json'});
  TagNotification.findOne({where:{user: req.session.DSSN.toString()}}).then(notification => {
    if (notification) {
      notification.message = '';
    } else {
      TagNotification.create({user: req.session.DSSN.toString(), message: ''});
    }
  });
  
  client.subscribe('esp32/conf', () => {
    client.on('message', (topic, est) => {
      console.log(`Received '${est}' on '${topic}'`);
      TagNotification.findOne({where:{user: req.session.DSSN.toString()}}).then(notification => {
        notification.message = est.toString();
        notification.save();
        res.end(JSON.stringify({resultado: 'ok'}));
      });
    });
  });
})

router.get('/rfidEquipo', (req, res) => {
    res.writeHead(200, {'Content-Type': 'application/json'})
    //console.log("el id del equipo es: "+ rfid2);
    //res.end(JSON.stringify(rfid2));

    
});
  
router.get('/confirmacion', (req, res) => {
    res.writeHead(200, {'Content-Type': 'application/json'})
    /*console.log("el estado es: "+ estado);
    res.end(JSON.stringify(estado));*/
    TagNotification.findOne({where:{user: req.session.DSSN.toString()}}).then(notification => {
      if (notification) {
        res.end(JSON.stringify({detectado: notification.message}));
      } else {
        res.end(JSON.stringify({detectado: 'error'}));
      }
    });
    
});

/*aumentado*/
// Ruta para obtener el equipo por el último tag almacenado
router.get('/equipment/rfid', async (req, res) => {
  try {
    // Consultar el último tag almacenado para el usuario actual
    const notification = await TagNotification.findOne({ where: { user: req.session.DSSN.toString() } });
    
    if (!notification || !notification.message) {
      return res.status(404).json({ error: 'No se ha leído ningún tag RFID recientemente.' });
    }

    const rfid = notification.message;

    // Buscar el equipo asociado al RFID en la base de datos
    const equipment = await Equipment.findOne({ where: { Code: rfid } });

    if (!equipment) {
      return res.status(404).json({ error: 'Equipo no encontrado para este RFID.' });
    }

    // Enviar los datos del equipo
    res.json(equipment);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al procesar la solicitud.' });
  }
});

module.exports=router;
