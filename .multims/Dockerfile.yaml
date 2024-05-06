# Dockerfile.template
FROM node:14

# Crea directorio de trabajo
WORKDIR /app

# Instala dependencias de la aplicación
COPY package*.json ./
RUN npm install

# Copia los archivos de la aplicación
COPY . .

# Expone el puerto en el que tu app corre
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]
