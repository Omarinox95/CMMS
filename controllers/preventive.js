const { Equipment, PreventiveTask } = require('../models');
const { Op } = require('sequelize');
const moment = require('moment');

// Obtener eventos para el calendario
exports.getPPMEvents = async (req, res) => {
  try {
    const tasks = await PreventiveTask.findAll({ include: [ {model:Equipment, as: 'equipmentTask',}] });

    const events = tasks.map(task => {
      let color = '#FFD700'; // Amarillo por defecto
      if (task.Status === 'Retrasada') color = '#FF0000';
      else if (task.Status === 'Finalizada') color = '#28a745';
      else if (task.Status === 'Reprogramada') color = '#800080';

      return {
        title: `MP - ${task.equipmentTask?.Name || task.EquipmentCode}`,
        start: task.ScheduledDate,
        color,
        url: `/engineer/ppm/${task.EquipmentCode}`
      };
    });

    res.json(events);
  } catch (error) {
    console.error('Error al obtener eventos:', error);
    res.status(500).json({ error: 'Error al obtener tareas preventivas' });
  }
};

// Mostrar vista del calendario preventivo
exports.renderCalendar = (req, res) => {
  res.render('engineer_ppm_calendar'); // Asegúrate de que esta vista exista
};

// Actualizar estado a Finalizada después de realizar el mantenimiento
exports.completePPMTask = async (req, res) => {
  try {
    const code = req.params.code;

    // Encuentra la tarea programada por código de equipo y estado "Programada"
    const task = await PreventiveTask.findOne({
      where: {
        EquipmentCode: code,
        Status: 'Programada'
      }
    });

    if (!task) {
      return res.status(404).json({ error: 'Tarea no encontrada o ya finalizada' });
    }

    task.Status = 'Finalizada';
    task.updatedAt = new Date();
    await task.save();

    res.json({ message: 'Tarea finalizada correctamente' });
  } catch (error) {
    console.error('Error actualizando tarea:', error);
    res.status(500).json({ error: 'No se pudo actualizar el estado de la tarea' });
  }
};

// Generar tareas preventivas con verificación de duplicados
exports.generateTasks = async (req, res) => {
  try {
    const equipments = await Equipment.findAll();
    const currentYear = moment().year();
    const newTasks = [];

    for (const eq of equipments) {
      const GE = eq.GE;
      const startDate = moment(eq.InstallationDate);
      if (!startDate.isValid()) continue;

      // Determinar intervalos según GE
      let months = [0]; // anual
      if (GE === 4 || GE === 5) months = [0, 6]; // semestral

      for (let m of months) {
        let scheduledDate = startDate.clone().add(m, 'months').year(currentYear);

        // Si cae sábado o domingo, mover a lunes
        if (scheduledDate.day() === 0) scheduledDate.add(1, 'day');
        if (scheduledDate.day() === 6) scheduledDate.add(2, 'day');

        const formattedDate = scheduledDate.format('YYYY-MM-DD');

        // Verificar si ya existe una tarea para esa fecha y equipo
        const existing = await PreventiveTask.findOne({
          where: {
            EquipmentCode: eq.Code,
            ScheduledDate: formattedDate
          }
        });

        if (!existing) {
          newTasks.push({
            EquipmentCode: eq.Code,
            ScheduledDate: formattedDate,
            Status: 'Programada',
            createdAt: new Date(),
            updatedAt: new Date()
          });
        }
      }
    }

    await PreventiveTask.bulkCreate(newTasks);
    res.json({ message: `${newTasks.length} tareas generadas correctamente` });

  } catch (error) {
    console.error('Error generando tareas preventivas:', error);
    res.status(500).json({ error: 'Error generando tareas preventivas' });
  }
};
