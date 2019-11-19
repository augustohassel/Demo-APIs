FROM rocker/r-ver:3.6.1

RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev

RUN R -e "install.packages('plumber')"

COPY / /

ENTRYPOINT ["Rscript", "main.R"]