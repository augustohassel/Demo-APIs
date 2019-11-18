FROM trestletech/plumber

RUN apt-get update -q && apt-get install -y \
  libmariadbclient-dev \
  libsodium-dev

RUN R -e "install.packages('RMySQL')"
RUN R -e "install.packages('sodium')"

COPY / /

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]

CMD ["/api/plumber.R"]