FROM ubuntu:xenial 
ADD  setup.sh /opt/ 
RUN  /bin/bash /opt/setup.sh

EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh
COPY ./healthchecker.sh /healthchecker.sh

HEALTHCHECK --interval=5m --timeout=3s --retries=1 CMD /healthchecker.sh

ENTRYPOINT ["/entrypoint.sh"]