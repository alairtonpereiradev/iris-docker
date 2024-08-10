# Use a imagem base do InterSystems IRIS
FROM containers.intersystems.com/intersystems/healthshare_clinicalviewer:2024.1

# Configurações do IRIS
ENV ISC_PACKAGE_INSTANCENAME=IRIS
ENV ISC_PACKAGE_IRIS_PASSWORD=gjsj1234

# Crie a instância
RUN iris start IRIS && \
    iris session IRIS -U %SYS '##class(System.Inst).Create("IRIS","",1,1)' && \
    iris stop IRIS quietly

# Expor as portas necessárias
EXPOSE 1972 52773

# Comando para iniciar o IRIS
CMD ["sh", "-c", "/usr/irissys/dev/Container/startIRIS.sh"]
