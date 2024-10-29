#!/bin/bash

#ponemos tiempo de espera
while ! pg_isready -h db -U postgres; do
    echo "Esperando a que PostgreSQL esté listo..."
    sleep 2
done

#creamos el usuario y la bbdd
echo "Iniciando base de datos..."
psql -U postgres -c "CREATE USER odoo WITH PASSWORD 'odoo';"
psql -U postgres -c "CREATE DATABASE ${APELLIDO}${XX} OWNER odoo;"

#iniciamos odooo con los parámetros definidos antes
echo "Iniciando Odoo..."
exec python3 /opt/odoo/odoo-bin -c /etc/odoo.conf
