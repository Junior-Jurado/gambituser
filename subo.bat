@echo off
REM Configura el entorno para compilar para Linux (AWS Lambda corre en Amazon Linux)
set GOOS=linux
set GOARCH=amd64

REM Compila el binario con el nombre correcto: bootstrap
go build -o bootstrap main.go

REM Borra cualquier ZIP anterior
if exist main.zip del main.zip

REM Crea el ZIP que contiene solo el archivo bootstrap
tar.exe -a -cf main.zip bootstrap

REM Limpieza opcional del binario local
REM del bootstrap

REM Git push opcional
git add .
git commit -m "Último Commit"
git push

echo.
echo ✅ ¡Listo! main.zip generado con bootstrap y código subido a Git.
pause
