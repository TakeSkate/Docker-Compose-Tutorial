#Este fichero no esta directamente relacionado con docker ni con docker-compose es decir lo hemos creado nosotros manualmente
#La funcion de este fichero es ayudarnos a ejecutar comandos sin tener que memorizarlos
#El uso de este fichero es el siguiente escribrimos el comando make seguido del comando a ejecutar [up , start, stop ,down, restart, rebuild, build , clean]
#EJEMPLO: make up
#Pero make no es un comando que por defecto viene en windows asi que para poder usarlo necesitamos instalar https://chocolatey.org/install
# 1º - Abrimos un cmd como administrador
# 2º - Ejecutamos: @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
# 3º - Instalamos make con el siguiente comando: choco install make
#Perfecto ahora ya podemos hacer uso del comando make lo cual es algo ALTAMENTE RECOMENDADO pero no obligatorio

up:
	docker-compose up -d

start: up

stop:
	docker-compose stop

down: stop
restart: stop up

rebuild: clean
	docker-compose build --force-rm --no-cache
	docker-compose up -d

build: clean
	docker-compose build
	docker-compose up -d

clean:
	docker-compose rm -vsf
	docker-compose down -v --remove-orphans
