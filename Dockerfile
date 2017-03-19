FROM gliderlabs/registrator
MAINTAINER gr4per

COPY start_registrator.sh .
ENTRYPOINT ["./start_registrator.sh"]
#CMD ["test1"]
