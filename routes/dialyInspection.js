const express = require('express');
const router = express.Router();
const { TagNotification, Equipment} = require('../models');

router.get('/api/ultimo-rfid', async (req, res) => {
    try {
        const ultimo = await TagNotification.findOne({
            where: { user: '1' }, // asumiendo que siempre llega el RFID del equipo con user = 1
            order: [['updatedAt', 'DESC']],
            raw: true,
        });

        if (!ultimo) return res.json(null);
        console.log('Último RFID (message):', ultimo.message);


        const code = ultimo.message;
        const equipo = await Equipment.findOne({
            where: { Code: code },
            attributes: ['Code', 'Name', 'SerialNumber', 'ModelId'],
            raw: true,
        });

        if (!equipo) return res.json(null);
        console.log('Equipo encontrado:', equipo);

        res.json({
            equipment: equipo.Code,
            modelId: equipo.ModelId || null,
            name: equipo.Name,
            serial: equipo.SerialNumber || 'Sin número de serie'
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error buscando equipo por RFID' });
    }
});

module.exports = router;
