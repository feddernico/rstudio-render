FROM rocker/rstudio:latest

ENV PORT=10000

RUN useradd -m -s /bin/bash rstudiouser

CMD ["/bin/sh", "-c", "\
    echo rstudiouser:${RSTUDIO_PASSWORD} | chpasswd && \
    echo 'www-port='${PORT} > /etc/rstudio/rserver.conf && \
    echo 'www-address=0.0.0.0' >> /etc/rstudio/rserver.conf && \
    /init"]
