FROM trestletech/plumber



RUN R -e "install.packages('RMySQL')"
RUN R -e "install.packages('sodium')"

COPY / /

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]

CMD ["/api/plumber.R"]