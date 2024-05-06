const Visitor = require('./models/visitor');
const requestIp = require('request-ip');
const { Op } = require('sequelize');

// Controlador para contar visitantes únicos por IP y por navegador
const getUniqueVisitors = async (req, res) => {
  try {
    // Obtener la dirección IP del cliente
    const clientIp = requestIp.getClientIp(req);

    // Contar visitantes únicos por IP
    const uniqueIPCount = await Visitor.count({
      distinct: 'ip'
    });

    // Contar visitantes únicos por navegador
    const uniqueUserAgentCount = await Visitor.count({
      distinct: 'userAgent'
    });

    res.json({
      uniqueIPCount,
      uniqueUserAgentCount,
      clientIp
    });
  } catch (error) {
    console.error('Error al obtener el número de visitantes:', error);
    res.status(500).send('Error al obtener el número de visitantes');
  }
};

const getAppVersion = (req, res) => {
    // Cargar el contenido del archivo package.json
    const packageInfo = require('./package.json');
    // Obtener la versión de la aplicación del archivo package.json
    const version = packageInfo.version;
    // Enviar la respuesta JSON con la versión
    res.json({ version });
  };

module.exports = { getUniqueVisitors,getAppVersion };
