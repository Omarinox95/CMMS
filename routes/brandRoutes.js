const express = require('express');
const router = express.Router();
const Brand = require('../models/brand');

// Obtener lista de marcas
router.get('/', async (req, res) => {
  try {
    const brands = await Brand.findAll();
    res.json(brands);
  } catch (err) {
    res.status(500).json({ error: 'Error al obtener marcas' });
  }
});

// Crear nueva marca (opcional)
router.post('/', async (req, res) => {
  const { Brand: brandName } = req.body;
  try {
    const newBrand = await Brand.create({ Brand: brandName });
    res.status(201).json(newBrand);
  } catch (err) {
    res.status(500).json({ error: 'Error al crear marca' });
  }
});

module.exports = router;
