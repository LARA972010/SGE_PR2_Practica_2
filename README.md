# Proyecto Odoo con Docker

Este proyecto utiliza Docker para ejecutar Odoo, un sistema de gestión empresarial de código abierto. Antes de iniciar la aplicación, asegúrate de seguir las instrucciones a continuación.

## Requisitos Previos

1. **Docker**: Asegúrate de tener Docker y Docker Compose instalados en tu máquina. Puedes encontrar las instrucciones de instalación en la [documentación oficial de Docker](https://docs.docker.com/get-docker/).

2. **Clonar el Repositorio de Odoo**: Antes de ejecutar el contenedor, necesitas clonar el repositorio de Odoo y colocarlo en la misma carpeta que este proyecto.

   ```bash
   git clone --depth=1 --branch=17.0 https://github.com/odoo/odoo.git ./odoo_source


3. **Configuración del entorno**: Crear el Archivo .env: Debes crear un archivo llamado .env en la raíz del proyecto. Este archivo debe contener las siguientes variables:

APELLIDO=tu_apellido
XX=tu_valor

4. **Construcción y Ejecución**:  Una vez que hayas clonado Odoo y creado el archivo .env, puedes construir y ejecutar los contenedores utilizando el siguiente comando:

docker-compose up --build -d

Este comando construirá la imagen de Docker para Odoo y levantará los contenedores necesarios.

5. **Acceso a Odoo**: Después de que los contenedores estén en funcionamiento, puedes acceder a Odoo en tu navegador en la siguiente dirección:

http://localhost:8089
