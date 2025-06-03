@echo off
REM Establecer entorno para Linux y arquitectura x86_64 (amd64)
set GOOS=linux
set GOARCH=amd64

REM Compilar como bootstrap (sin extensión .exe)
go build -o bootstrap main.go

REM Eliminar archivo zip anterior si existe
del main.zip

REM Crear nuevo ZIP con el ejecutable llamado bootstrap
tar.exe -a -cf main.zip bootstrap

REM Git push opcional
git add .
git commit -m "Último Commit"
git push


echo.
echo Compilacion y empaquetado completado. Archivo: main.zip
pause

