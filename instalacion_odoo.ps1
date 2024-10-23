# Lee el archivo .env para pillar contraseña, nombre de bbdd, correo 
$envPath = ".\.env"
$envContent = Get-Content $envPath
foreach ($line in $envContent) {
    $name, $value = $line -split '='
    [System.Environment]::SetEnvironmentVariable($name, $value)
}

# Instalamos dependencias y mandamos mensaje para saber lo que está haciendo nuestro script:
Write-Host "Instalando dependencias..."
choco install git
choco install python --version=3.9.7
choco install postgresql


# Mediante la info que tenemos en el .env creamos usuario:
Write-Host "Creando usuario de base de datos..."
psql -U postgres -c "CREATE USER $env:DB_USER WITH PASSWORD '$env:DB_PASSWORD';"
psql -U postgres -c "ALTER ROLE $env:DB_USER CREATEDB;"

# Clonamos Odoo en el repo (asumiendo que ya lo tienes clonado, este paso se puede omitir)
Write-Host "Clonando Odoo..."
cd "C:\Users\Lara\SGE_PR2_Practica_2\odoo"  # Asegúrate de que esta sea la ruta correcta

# Instalamos dependencias de Python
Write-Host "Instalando dependencias de Python..."
python -m pip install -r requirements.txt

# Configurar Odoo
Write-Host "Configurando Odoo..."
$odooConfig = @"
[options]
; This is the password that allows database operations:
admin_passwd = admin
db_name = $env:DB_NAME
db_user = $env:DB_USER
db_password = $env:DB_PASSWORD
addons_path = addons
logfile = C:\Users\Lara\SGE_PR2_Practica_2\odoo\odoo.log  # Ajusta la ruta si es necesario
"@

# Cambia esta línea para usar la ruta correcta
$odooConfigPath = "C:\Users\Lara\SGE_PR2_Practica_2\odoo\odoo.conf"
$odooConfig | Out-File -FilePath $odooConfigPath -Encoding utf8

# Abrimos Odoo:
Write-Host "Ejecutando Odoo..."
python odoo-bin -c $odooConfigPath
