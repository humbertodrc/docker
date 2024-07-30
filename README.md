
# Dockerfile y su relación con una imagen Docker

## Dockerfile

Un **Dockerfile** es un archivo de texto con una serie de instrucciones que le indican a Docker cómo construir una imagen. Las instrucciones pueden incluir:

- **FROM**: Especifica la imagen base a partir de la cual se construirá la nueva imagen.
- **RUN**: Ejecuta comandos en el contenedor.
- **COPY** o **ADD**: Copia archivos o directorios desde tu máquina local al sistema de archivos del contenedor.
- **CMD** o **ENTRYPOINT**: Especifica el comando que se ejecutará cuando se inicie un contenedor a partir de la imagen.

Ejemplo básico de un Dockerfile:

```Dockerfile
# Usa una imagen base de Python
FROM python:3.9

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de requisitos en el directorio de trabajo
COPY requirements.txt .

# Instala las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código de la aplicación
COPY . .

# Especifica el comando por defecto para ejecutar la aplicación
CMD ["python", "app.py"]
```

## Imagen Docker

Una **imagen Docker** es un snapshot de un contenedor. Es el resultado de construir un Dockerfile. La imagen contiene todo lo necesario para ejecutar una aplicación: el código, las dependencias, las herramientas, las configuraciones y el sistema operativo.

Para construir una imagen a partir de un Dockerfile, se usa el comando:

```bash
docker build -t nombre_de_la_imagen .
```

## Relación entre Dockerfile e Imagen

1. **Creación del Dockerfile**: Primero, escribes un Dockerfile con las instrucciones para construir la imagen.
2. **Construcción de la Imagen**: Luego, ejecutas `docker build` para construir la imagen a partir del Dockerfile.
3. **Generación de la Imagen**: Docker lee las instrucciones del Dockerfile y genera una imagen que contiene todo el entorno de ejecución de tu aplicación.

## Contenedor Docker

Un **contenedor Docker** es una instancia de una imagen. Los contenedores se ejecutan como procesos independientes y aislados, pero comparten el mismo kernel del sistema operativo host. Puedes pensar en una imagen como una plantilla y en un contenedor como una instancia ejecutada de esa plantilla.

Para ejecutar un contenedor a partir de una imagen, se usa el comando:

```bash
docker run nombre_de_la_imagen
```

## Despliegue con Docker

En términos de despliegue, normalmente realizas el despliegue de contenedores, que son instancias de tus imágenes Docker. Sin embargo, para poder desplegar un contenedor, primero necesitas tener la imagen correspondiente.

Por lo tanto:

1. **Escribes el Dockerfile**.
2. **Construyes la imagen** usando el Dockerfile.
3. **Ejecutas contenedores** a partir de esa imagen.

La herramienta **Docker** es el motor que gestiona todo este ciclo de vida: escribir Dockerfiles, construir imágenes, ejecutar y gestionar contenedores.
