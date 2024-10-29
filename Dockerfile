#Usa una imagen base de Debian con Python:
FROM python:3.10-slim

#actualiza repositorios e instala dependencias
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    libevent-dev \
    libsasl2-dev \
    libldap2-dev \
    libjpeg-dev \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    python3-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

#crear usuario de odoo
RUN useradd -m -d /opt/odoo -U -r -s /bin/bash odoo

#directorio de trabj y permisoss
WORKDIR /opt/odoo

#copiar el código descargado localmente a la imagen
COPY ./odoo_source /opt/odoo
RUN chown -R odoo:odoo /opt/odoo

#instalar dependencias de Python
USER root
RUN pip install -r requirements.txt

#copiar archivos: importante el script 
COPY ./odoo.conf /etc/odoo.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8069

ENTRYPOINT ["/entrypoint.sh"]
