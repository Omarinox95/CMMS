const { Op } = require('sequelize');
const Equipment = require('../models/equipment');  // Asegúrate de que el modelo esté correctamente importado

// Controlador para manejar la búsqueda de equipos
exports.searchEquipment = (req, res) => {
    // Extraemos los parámetros de la query
    const { searchBy, searchValue } = req.query;

    // Comprobamos si se han proporcionado los valores de búsqueda
    if (!searchBy || !searchValue) {
        return res.render('searchequipment', { error: 'Debe proporcionar un criterio de búsqueda válido.' });
    }

    // Construimos la consulta dinámica
    let query = {};
    query[searchBy] = { [Op.like]: `%${searchValue}%` };

    // Realizamos la búsqueda en la base de datos usando el modelo 'Equipment'
    Equipment.findAll({ where: query, include: ['Department'] })  // Incluimos 'Department' si lo necesitas
        .then(results => {
            // Si hay resultados, los pasamos a la vista
            if (results.length > 0) {
                // Mapeamos los resultados para incluir los datos de 'Department' si es necesario
                const formattedResults = results.map(equipment => ({
                    Code: equipment.Code,
                    Name: equipment.Name,
                    Model: equipment.Model,
                    Location: equipment.Location,
                    Department: equipment.Department ? equipment.Department.Name : 'Sin departamento',  // Suponiendo que 'Department' es un objeto relacionado
                }));

                // Renderizamos la vista con los resultados
                res.render('searchequipment', { results: formattedResults });
            } else {
                // Si no se encuentran resultados, mostramos un mensaje
                res.render('searchequipment', { error: 'No se encontraron resultados.' });
            }
        })
        .catch(err => {
            // En caso de error en la consulta, mostramos un mensaje
            console.log(err);
            res.render('searchequipment', { error: 'Hubo un error en la búsqueda.' });
        });
};
