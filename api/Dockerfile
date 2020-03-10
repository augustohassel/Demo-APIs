FROM rocker/r-ver:3.6.1

RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('quantmod')"
RUN R -e "install.packages('dygraphs')"
RUN R -e "install.packages('xts')"

COPY / /

ENTRYPOINT ["Rscript", "main.R"]