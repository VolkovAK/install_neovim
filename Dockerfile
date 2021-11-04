from ubuntu:18.04

COPY ./* /

RUN /bin/bash ./install_nvim.sh

