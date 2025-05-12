const { Equipment, PreventiveTask } = require('../models');
const { addDays, addMonths } = require('date-fns');

function ajustarFecha(fecha) {
  const day = fecha.getDay();
  return day === 0 ? addDays(fecha, 1) : fecha;
}

async function generarTareasPreventivas() {
  const equipos = await Equipment.findAll();

  for (const equipo of equipos) {
    const ge = equipo.GE;
    const instalacion = new Date(equipo.InstallationDate);
    let fechas = [];

    if ([1, 2, 3].includes(ge)) {
      fechas.push(ajustarFecha(new Date(instalacion.getFullYear() + 1, instalacion.getMonth(), instalacion.getDate())));
    } else if ([4, 5].includes(ge)) {
      fechas.push(ajustarFecha(addMonths(instalacion, 6)));
      fechas.push(ajustarFecha(addMonths(instalacion, 12)));
    }

    for (const fecha of fechas) {
      const existe = await PreventiveTask.findOne({
        where: {
          EquipmentCode: equipo.Code,
          ScheduledDate: fecha.toISOString().split('T')[0]
        }
      });

      if (!existe) {
        await PreventiveTask.create({
          EquipmentCode: equipo.Code,
          ScheduledDate: fecha
        });
      }
    }
  }
}

module.exports = generarTareasPreventivas;
