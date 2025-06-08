const express = require('express');
const router = express.Router();
const TagNotification = require('../models/tagnotification');
const Equipment = require('../models/equipment');
const client = require('./emqx-connection'); // Asegúrate que exportas client en emqx-connection.js
// Agrega esta línea justo debajo
const { setLastCodeToWrite } = require('./emqx-connection');

/*router.post('/rfid/sendCode', (req, res) => {
    const { Code } = req.body;
    if (!Code) {
        return res.status(400).json({ message: 'Código no recibido' });
    }

    // Enviar al tópico que el ESP32 escucha para grabar código en RFID
    client.publish('esp32/write', Code.toString(), { qos: 0 }, (err) => {
        if (err) {
            console.error('Error al publicar en MQTT:', err);
            return res.status(500).json({ message: 'Error al enviar a MQTT' });
        }

        return res.json({ message: 'Código enviado al ESP32 para grabar' });
    });
});*/
router.post('/rfid/sendCode', (req, res) => {
  console.log('Body recibido en /rfid/sendCode:', req.body);
    const Code = req.body.Code;
    if (!Code) {
        return res.status(400).json({ message: 'Código no recibido' });
    }

    // Guardar el código para que el ESP lo pueda usar cuando responda "si"
    setLastCodeToWrite(Code.toString());

    return res.json({ message: 'Código listo para ser enviado cuando el ESP32 confirme.' });
});

// Ruta para inicializar o limpiar la notificación del usuario
router.post('/tagstopicsubscribe', async (req, res) => {
  try {
    const { code } = req.body;
    let notification = await TagNotification.findOne({ where: { user: req.session.DSSN.toString() } });
    if (!notification) {
      notification = await TagNotification.create({ user: req.session.DSSN.toString(), message: '' });
    } else {
      notification.message = code;
      await notification.save();
    }
    res.json({ resultado: 'ok' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno en /tagstopicsubscribe' });
  }
});

// Ruta para obtener estado actual del tag leído
router.get('/confirmacion', async (req, res) => {
  try {
    const notification = await TagNotification.findOne({ where: { user: req.session.DSSN.toString() } });
    if (notification && notification.message) {
      console.log("Notificación encontrada:", notification.message);
      res.json({ detectado: notification.message });
    } else {
      console.log("No se encontró notificación para el usuario.");
      res.json({ detectado: 'error' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ detectado: 'error' });
  }
});

// Ruta para obtener equipo por RFID leído más reciente
router.get('/equipment/rfid', async (req, res) => {
  try {
    const notification = await TagNotification.findOne({ where: { user: req.session.DSSN.toString() } });
    if (!notification || !notification.message) {
      return res.status(404).json({ error: 'No se ha leído ningún tag RFID recientemente.' });
    }

    const rfid = notification.message;

    const equipment = await Equipment.findOne({ where: { Code: rfid } });

    if (!equipment) {
      return res.status(404).json({ error: 'Equipo no encontrado para este RFID.' });
    }

    res.json(equipment);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al procesar la solicitud.' });
  }
});

module.exports = router;

