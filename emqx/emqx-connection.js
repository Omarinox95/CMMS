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
        //const rfid1 = rfid.toString();
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
  });

module.exports = client;*/

const TagNotification = require('../models/tagnotification');
const mqtt = require('mqtt');

const clientId = 'mqttjs_' + Math.random().toString(16).substr(2, 8);
const host = 'ws://broker.emqx.io:8083/mqtt';

const options = {
  keepalive: 60,
  clientId,
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

let lastCodeToWrite = null; // Se actualiza desde el frontend

client.on('connect', () => {
  console.log('Cliente conectado');

  // Suscribirse a todos los topics necesarios
  client.subscribe(['esp32/rfid', 'lecturaEquipo', 'esp32/conf'], (err) => {
    if (err) {
      console.log('Error al suscribirse:', err);
    } else {
      console.log('Subscripción a topics exitosa');
    }
  });
});

// Manejar todos los mensajes entrantes aquí
client.on('message', async (topic, message) => {
  const payload = message.toString();
  console.log(`Mensaje recibido en '${topic}': ${payload}`);

  try {
    const d = new Date();
    d.setHours(d.getHours() - 4);
    const fecha = d.toISOString().replace('T', ' ').substr(0, 19);

    if (topic === 'esp32/rfid') {
      if (payload.startsWith('s')) {
        // Salida
        const rfidReal = payload.substr(1);
        if (/^\d+$/.test(rfidReal)) {
          mySQL.query(`UPDATE rfid SET fecha_salida = '${fecha}' WHERE pac = ${rfidReal} AND fecha_salida IS NULL`, (err, result) => {
            if (err) console.log('MySQL update error:', err);
            else console.log('Registro salida actualizado:', result);
          });
        }
      } else if (payload.startsWith('e')) {
        // Entrada
        const rfidReal = payload.substr(1);
        if (/^\d+$/.test(rfidReal)) {
          mySQL.query(`INSERT INTO rfid(pac, fecha_entrada) VALUES ('${rfidReal}', '${fecha}')`, (err, result) => {
            if (err) console.log('MySQL insert error:', err);
            else console.log('Registro entrada insertado:', result);
          });
        }
      }

      // Actualizar o crear notificación para usuario
    /*  await TagNotification.upsert({
        user: 'currentUser', // Cambia por usuario real según tu sesión o lógica
        message: payload,
      });*/
    }

    if (topic === 'esp32/conf') {
      // Guardar configuración recibida en TagNotification para usuario
      /*await TagNotification.upsert({
        user: 'currentUser', // Cambia según usuario real
        message: payload,
      });*/
    }
    if (topic === 'esp32/conf') {
  console.log('Confirmación recibida del ESP32:', payload);

  if (payload.trim().toLowerCase() === 'si') {
    if (lastCodeToWrite) {
      client.publish('esp32/write', lastCodeToWrite, { qos: 0 }, (err) => {
        if (err) {
          console.error('Error al publicar el código al ESP32:', err);
        } else {
          console.log(`Código ${lastCodeToWrite} enviado a esp32/write`);
        }
      });
    } else {
      console.log('No hay código almacenado para enviar.');
    }
  }
}


    // Puedes agregar lógica similar para otros topics

  } catch (error) {
    console.error('Error procesando mensaje MQTT:', error);
  }
});

module.exports = client;
// Al final del archivo
module.exports = client;
module.exports.setLastCodeToWrite = (code) => {
  lastCodeToWrite = code;
};
