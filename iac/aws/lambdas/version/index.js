// Cargar el contenido del archivo package.json
const packageInfo = require('./package.json');

// Exportar la función handler de la Lambda
exports.handler = async (event, context) => {
  try {
    // Obtener la versión de la aplicación del archivo package.json
    const version = packageInfo.version;
    // Enviar la respuesta JSON con la versión
    return {
      statusCode: 200,
      body: JSON.stringify({ version })
    };
  } catch (error) {
    console.error('Error al obtener la versión de la aplicación:', error);
    return {
      statusCode: 500,
      body: 'Error al obtener la versión de la aplicación'
    };
  }
};
