const express = require('express');
const router = express.Router();
const { getUniqueVisitors, getAppVersion } = require('./controller');

// Ruta para contar visitantes únicos
router.get('/', getUniqueVisitors);


// Ruta para obtener la versión de la aplicación
router.get('/version', getAppVersion);

module.exports = router;
