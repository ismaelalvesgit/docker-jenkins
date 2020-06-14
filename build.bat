set versao=1.0.0
set repositorio=./v.1.0.0

ECHO "### Iniciando o build da versão %versao% ======================>"
docker build -t ismaelalvesdoc/jenkins:%versao% %repositorio%
ECHO "<====================== Iniciando o build da última versão ======================>"
docker build -t ismaelalvesdoc/jenkins:latest %repositorio%
echo "<====================== Build Finalizado ======================>"