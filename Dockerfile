# Usamos una imagen base de Node.js con Alpine Linux.
# Alpine Linux es una distribución pequeña y segura que reduce el tamaño de la imagen.
FROM node:20-alpine

# Establecemos el directorio de trabajo dentro del contenedor.
# Todos los comandos siguientes serán ejecutados desde este directorio.
WORKDIR /docker

# Copiamos todos los archivos del directorio actual (en tu máquina host)
# al directorio de trabajo dentro del contenedor.
COPY . .

# Instalamos las dependencias del proyecto utilizando npm.
# Este comando lee el archivo package.json para instalar las dependencias especificadas.
RUN npm install

# Exponemos el puerto 3000 para que pueda ser accesible desde el exterior del contenedor.
# Esto es útil para aplicaciones web que corren en este puerto.
EXPOSE 3000

# Definimos el comando por defecto que se ejecutará cuando el contenedor inicie.
# En este caso, ejecuta el comando `npm start` para iniciar la aplicación.
CMD ["npm", "start"]
