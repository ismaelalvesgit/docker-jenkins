#!/bin/bash

versao=0.0.4
repositorio='./V.0.1.0'

echo "<====================== Iniciando o build da versão $versao ======================>"
docker build -t ismaelalvesdoc/jenkins:${versao} ${repositorio}
echo "<====================== Iniciando o build da última versão ======================>"
docker build -t ismaelalvesdoc/jenkins ${repositorio}
echo "<====================== Build Finalizado ======================>"