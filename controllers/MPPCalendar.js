// controllers/MPPCalendarController.js

//const { Ppm, Equipment, ClinicalEngineer, PpmQuestions } = require('../models');

/*
exports.ppmCalendar = (req, res) => {
    PPM.findAll({
        include: [
            { model: Equipment, include: [{ model: PpmQuestions }] },
            { model: ClinicalEngineer }
        ]
    }).then(reports => {
        const reps = reports.map(report => {
            return {
                Code: report.Code,
                DATE: report.DATE,
                Engineer: report.ClinicalEnginner.FName + ' ' + report.ClinicalEnginner.LName,
                EquipmentName: report.Equipment.Name,
                EquipmentCode: report.Equipment.Code,
                EquipmentModel: report.Equipment.Model,
                Qs: report.Equipment.PpmQuestion,
                Q1: report.Q1 == "on" ? true : false,
                Q2: report.Q2 == "on" ? true : false,
                Q3: report.Q3 == "on" ? true : false,
                Q4: report.Q4 == "on" ? true : false,
                Q5: report.Q5 == "on" ? true : false,
                N1: report.N1,
                N2: report.N2,
                N3: report.N3,
                N4: report.N4,
                N5: report.N5
            };
        });

        res.render('calendar', {
            pageTitle: 'Calendario de Mantenimiento Preventivo',
            events: reps.map(event => ({
                title: `${event.EquipmentName} - ${event.EquipmentModel}`,
                start: `${event.DATE}T00:00:00Z`, // Formato de fecha para FullCalendar
                end: `${event.DATE}T23:59:59Z`,   // Rango de 24 horas
                url: `/engineer/ppm/${event.Code}` // Enlace para ver más detalles
            })),
            hasReports: reps.length > 0
        });
    }).catch(err => {
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/home',
            message: 'Sorry !!! Could Not Get Reports'
        });
    });
};

// Detalles de un mantenimiento preventivo
exports.ppmDetails = (req, res) => {
    const code = req.params.code;

    PPM.findOne({
        where: { Code: code },
        include: [
            { model: Equipment, include: [{ model: PpmQuestions }] },
            { model: ClinicalEngineer }
        ]
    }).then(report => {
        if (!report) {
            return res.render('error', {
                layout: false,
                pageTitle: 'Error',
                href: '/engineer/ppm',
                message: 'Mantenimiento Preventivo no encontrado'
            });
        }

        res.render('ppmReportDetails', {
            pageTitle: 'Detalles del Mantenimiento Preventivo',
            report: report
        });
    }).catch(err => {
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/engineer/ppm',
            message: 'No se pudo obtener los detalles del reporte'
        });
    });
};
*/
// controllers/MPPCalendarController.js
/*
exports.ppmCalendar = (req, res) => {
    Ppm.findAll({
        include: [
            { model: Equipment, include: [{ model: PpmQuestions }] },
            { model: ClinicalEngineer }
        ]
    }).then(reports => {
        const reps = reports.map(report => {
            return {
                Code: report.Code,
                DATE: report.DATE,
                Engineer: report.ClinicalEnginner.FName + ' ' + report.ClinicalEnginner.LName,
                EquipmentName: report.Equipment.Name,
                EquipmentCode: report.Equipment.Code,
                EquipmentModel: report.Equipment.Model,
                Qs: report.Equipment.PpmQuestion,
                Q1: report.Q1 == "on" ? true : false,
                Q2: report.Q2 == "on" ? true : false,
                Q3: report.Q3 == "on" ? true : false,
                Q4: report.Q4 == "on" ? true : false,
                Q5: report.Q5 == "on" ? true : false,
                N1: report.N1,
                N2: report.N2,
                N3: report.N3,
                N4: report.N4,
                N5: report.N5
            };
        });

        res.render('MPPCalendar', {
            pageTitle: 'Calendario de Mantenimiento Preventivo',
            events: reps.map(event => ({
                title: `${event.EquipmentName} - ${event.EquipmentModel}`,
                start: `${event.DATE}T00:00:00Z`, // Formato de fecha para FullCalendar
                end: `${event.DATE}T23:59:59Z`,   // Rango de 24 horas
                url: `/engineer/ppm/${event.Code}`, // Enlace para ver más detalles
                color: event.Q1 ? 'red' : 'green'  // Ejemplo de color según condición
            })),
            hasReports: reps.length > 0
        });
    }).catch(err => {
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/home',
            message: 'Sorry !!! Could Not Get Reports'
        });
    });
};*/
// controllers/MPPCalendarController.js

/*funciona todo pero no abre el calendario 12/11*/
/*
const { Ppm, Equipment, ClinicalEngineer, PpmQuestions } = require('../models');

exports.ppmCalendar = (req, res) => {
    Ppm.findAll({
        include: [
            { model: Equipment, include: [{ model: PpmQuestions }] },
            { model: ClinicalEngineer }
        ]
    }).then(reports => {
        const reps = reports.map(report => {
            return {
                Code: report.Code,
                DATE: report.DATE,
                Engineer: report.ClinicalEnginner.FName + ' ' + report.ClinicalEnginner.LName,
                EquipmentName: report.Equipment.Name,
                EquipmentCode: report.Equipment.Code,
                EquipmentModel: report.Equipment.Model,
                Qs: report.Equipment.PpmQuestion,
                Q1: report.Q1 == "on" ? true : false,
                Q2: report.Q2 == "on" ? true : false,
                Q3: report.Q3 == "on" ? true : false,
                Q4: report.Q4 == "on" ? true : false,
                Q5: report.Q5 == "on" ? true : false,
                N1: report.N1,
                N2: report.N2,
                N3: report.N3,
                N4: report.N4,
                N5: report.N5
            };
        });

        res.render('MPPCalendar', {
            pageTitle: 'Calendario de Mantenimiento Preventivo',
            events: reps.map(event => ({
                title: `${event.EquipmentName} - ${event.EquipmentModel}`,
                start: `${event.DATE}T00:00:00Z`,
                end: `${event.DATE}T23:59:59Z`,
                url: `/engineer/ppm/${event.Code}`,
                color: event.Q1 ? 'red' : 'green'
            })),
            hasReports: reps.length > 0
        });
    }).catch(err => {
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/home',
            message: 'Sorry !!! Could Not Get Reports'
        });
    });
};

exports.ppmDetails = (req, res) => {
    const code = req.params.code;

    Ppm.findOne({
        where: { Code: code },
        include: [
            { model: Equipment, include: [{ model: PpmQuestions }] },
            { model: ClinicalEngineer }
        ]
    }).then(report => {
        if (!report) {
            return res.render('error', {
                layout: false,
                pageTitle: 'Error',
                href: '/engineer/ppm',
                message: 'Mantenimiento Preventivo no encontrado'
            });
        }

        res.render('ppmReportDetails', {
            pageTitle: 'Detalles del Mantenimiento Preventivo',
            report: report
        });
    }).catch(err => {
        res.render('error', {
            layout: false,
            pageTitle: 'Error',
            href: '/engineer/ppm',
            message: 'No se pudo obtener los detalles del reporte'
        });
    });
};
*/

//AUMENTADO 15:52 
// controllers/MPPCalendar.js
/*
const { Ppm, Equipment, Clinical_enginner } = require('../models');

exports.ppmCalendar = async (req, res) => {
  try {
    const ppms = await Ppm.findAll({ include: [Equipment, Clinical_enginner] });
    const events = ppms.map(ppm => ({
      title: `${ppm.Equipment.Name} - ${ppm.DATE}`,
      start: ppm.DATE,
      url: `/calendar/ppm/${ppm.Code}`,
      color: ppm.isCompleted ? 'green' : 'red'
    }));
    res.render('MPPCalendar', { pageTitle: 'PPM Calendar', events });
  } catch (error) {
    res.status(500).send('Error al cargar el calendario');
  }
};

exports.ppmDetails = async (req, res) => {
  try {
    const ppm = await Ppm.findOne({ where: { Code: req.params.code }, include: [Equipment, Clinical_enginner] });
    if (!ppm) return res.status(404).render('error', { pageTitle: 'PPM no encontrado' });
    res.render('ppm', { pageTitle: 'PPM Detalles', report: ppm });
  } catch (error) {
    res.status(500).send('Error al cargar detalles de PPM');
  }
};*/

