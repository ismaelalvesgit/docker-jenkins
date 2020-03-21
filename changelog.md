# v.2.2.2:
-  Nova imagem do slave: cloudbees/java-build-tools (https://hub.docker.com/r/cloudbees/java-build-tools/);
-  Setup Maven via Apache: ToolMaven.groovy com nova estrutura;

# v.2.2.1:
-  Os pacotes de instalação do Maven e da JDK foram inseridos na imagem.  
   A recomendação é que, você utilize seu gerenciador de artefatos (artifactory, nexus, etc) para prover este download em tempo de execução.
-  Dois pipelines reais são criados através de um arquivo texto.

# v.2.2.0:
-  Merged Groovy with Gradle pattern

# v.0.3.0:
-  Automação de backups e Recovery. 

# v.0.2.0:
-  plugins inseridos na imagem. 

# v.0.1.0:
-  GIT e JDK 8 foram inseridos na imagem. 