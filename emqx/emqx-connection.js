const mqtt = require('mqtt');

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

    /*client.subscribe('emqx/esp32', () => {
        client.on('message', (topic, message) => {
            console.log('Mensaje recibido:', message);
        });
    });*/
  
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

        //aumentado 22
        // Enviar el RFID al tema 'lecturaEquipo' para que se lea en el frontend
       // client.publish('lecturaEquipo', rfid1);  // Publicar el RFID para que el frontend lo reciba

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

module.exports = client;