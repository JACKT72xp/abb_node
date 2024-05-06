const requestIp = require('request-ip');
const { DataTypes } = require('sequelize');

// Aquí puedes definir tu modelo Visitor si prefieres tenerlo en el mismo archivo
const sequelize = new Sequelize({
  dialect: 'postgres',
  database: 'mydb',
  username: 'postgres',
  password: 'password',
  host: 'localhost',
  port: 5432,
});

const Visitor = sequelize.define('Visitor', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  ip: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true
  },
  userAgent: {
    type: DataTypes.STRING,
    allowNull: false
  },
  createdAt: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  updatedAt: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
});

// Aquí exportamos la función handler de la Lambda
exports.handler = async (event, context) => {
  try {
    // Obtener la dirección IP del cliente
    const clientIp = requestIp.getClientIp({ headers: event.headers });

    // Contar visitantes únicos por IP
    const uniqueIPCount = await Visitor.count({
      distinct: 'ip'
    });

    // Contar visitantes únicos por navegador
    const uniqueUserAgentCount = await Visitor.count({
      distinct: 'userAgent'
    });

    return {
      statusCode: 200,
      body: JSON.stringify({
        uniqueIPCount,
        uniqueUserAgentCount,
        clientIp
      })
    };
  } catch (error) {
    console.error('Error al obtener el número de visitantes:', error);
    return {
      statusCode: 500,
      body: 'Error al obtener el número de visitantes'
    };
  }
};
