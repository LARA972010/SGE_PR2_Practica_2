# Guía de Instalación para Odoo

Este documento proporciona los pasos necesarios para instalar y configurar Odoo usando PowerShell y Chocolatey en Windows.

## Requisitos Previos

1. **Windows**: Este script está diseñado para ser ejecutado en un entorno Windows.
2. **PowerShell**: Asegúrate de que PowerShell esté instalado y accesible.
3. **Acceso a Internet**: Necesario para descargar dependencias y paquetes.

## Instalación de Chocolatey

Chocolatey es un gestor de paquetes para Windows que facilita la instalación de software. Sigue estos pasos para instalarlo:

1. **Abrir PowerShell** como Administrador:
   - Haz clic derecho en el menú de inicio y selecciona "Windows PowerShell (Admin)".

2. **Instalar Chocolatey**:
   Ejecuta el siguiente comando en la ventana de PowerShell:

   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; \
   [System.Net.WebRequest]::Create('https://chocolatey.org/install.ps1').GetResponse().GetResponseStream() | iex
