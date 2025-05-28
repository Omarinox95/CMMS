// utils/actualizarFRecordYGE.js
const { Equipment, Workorder, NameEquipment } = require('../models');
const { Op } = require('sequelize');

module.exports = async function actualizarFRecordYGE() {
  try {
    const equipos = await Equipment.findAll();

    const hoy = new Date();

    for (const equipo of equipos) {
      const workorders = await Workorder.findAll({
        where: {
          EquipmentCode: equipo.Code,
          id_StopReason: 2
        }
      });

      // Calcular F_record
      let f_record = -2;
      const fechas = workorders
        .map(w => new Date(w.StartDate))
        .filter(fecha => !isNaN(fecha));

      if (fechas.length > 0) {
        fechas.sort((a, b) => a - b);
        const meses = fechas.map(fecha => {
          const diff = (hoy.getFullYear() - fecha.getFullYear()) * 12 + hoy.getMonth() - fecha.getMonth();
          return diff;
        });

        if (fechas.length > 6) {
          f_record = 2;
        } else {
          const diffs = [];
          for (let i = 1; i < fechas.length; i++) {
            const mesesEntre = (fechas[i].getFullYear() - fechas[i - 1].getFullYear()) * 12 + fechas[i].getMonth() - fechas[i - 1].getMonth();
            diffs.push(mesesEntre);
          }
          const promedio = diffs.length > 0 ? diffs.reduce((a, b) => a + b, 0) / diffs.length : null;

          if (promedio !== null) {
            if (promedio <= 8) f_record = 1;
            else if (promedio <= 18) f_record = 0;
            else if (promedio <= 30) f_record = -1;
          }
        }
      }

      // Buscar datos adicionales desde nameequipment
      const nameE = await NameEquipment.findOne({ where: { id_nameE: equipo.NameEquipmentId } });
      const functionValue = nameE ? nameE.function : 0;
      const aplicationValue = nameE ? nameE.aplication : 0;

      // Calcular GE
      const GE = (equipo.Maintenance_Req || 0) + functionValue + aplicationValue + f_record;

      // Actualizar equipo
      await equipo.update({ F_record: f_record, GE });
    }

    console.log('✅ Actualización de F_record y GE completada.');
  } catch (error) {
    console.error('❌ Error al actualizar F_record y GE:', error);
  }
};