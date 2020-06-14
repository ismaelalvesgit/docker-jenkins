#!/bin/bash

versao=0.0.4
repositorio='./V.0.1.0'

echo "<====================== Iniciando o build da versão $versao ======================>"
docker build -t ismaelalvesdoc/jenkins:${versao} ${repositorio}
echo "<====================== Iniciando o build da última versão ======================>"
docker build -t ismaelalvesdoc/jenkins ${repositorio}
echo "<====================== Enviando imagem na versão $versao para o repositorio ======================>"
docker push ismaelalvesdoc:${$versao}
echo "<====================== Enviando imagem na última versão para o repositorio ======================>"
docker push ismaelalvesdoc
echo "<====================== Deploy Finalizado ======================>"
echo "<============ Iniciando clear Images dangling ==============>"
docker rmi --force $(docker images -q --filter "dangling=true")
echo "<============ Finalizando clear Images dangling ==============>"