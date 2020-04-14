FROM rocker/verse:latest

RUN apt-get update -qq && apt-get install -y \
      libssl-dev \
      libcurl4-gnutls-dev \
      pandoc \
      pandoc-citeproc

RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('quantmod')"
RUN R -e "install.packages('dygraphs')"
RUN R -e "install.packages('xts')"

COPY / /

ENTRYPOINT ["Rscript", "main.R"]