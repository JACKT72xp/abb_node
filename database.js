const { Sequelize } = require('sequelize');

// Configuración de la base de datos
const sequelize = new Sequelize({
  dialect: 'postgres',
  database: 'mydb',
  username: 'postgres',
  password: 'password',
  host: 'localhost',
  port: 5432,
});

// Sincronización de los modelos con la base de datos
(async () => {
  try {
    await sequelize.authenticate();
    await sequelize.sync(); // Esto sincronizará todos los modelos con la base de datos
    console.log('Todos los modelos han sido sincronizados correctamente');
  } catch (error) {
    console.error('Error al sincronizar los modelos:', error);
  }
})();

// Sincronización de los modelos con la base de datos si sync_db es True
const syncDatabase = async () => {
    try {
      if (process.env.sync_db === 'True') {
        await sequelize.sync({ alter: true }); // Esto sincronizará automáticamente los modelos con la base de datos
        console.log('Base de datos sincronizada correctamente');
      } else {
        console.log('sync_db es False, no se sincroniza la base de datos');
      }
    } catch (error) {
      console.error('Error al sincronizar la base de datos:', error);
    }
  };
  
// Llama a la función para sincronizar la base de datos
syncDatabase();
// Exportar la instancia de Sequelize
module.exports = sequelize;
