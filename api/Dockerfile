FROM rocker/r-ver:3.6.1

RUN R -e "install.packages('plumber')"

COPY . ./

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[1]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]

CMD ["plumber.R"]