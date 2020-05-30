# https://github.bom/StefanScherer/docker-windows/blob/master/chocolatey/Dockerfile

ARG version=ltsc2016
FROM --platform=windows/amd64 mcr.microsoft.com/windows/servercore:${version}

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    iex ( (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1') ); \
    choco feature disable --name showDownloadProgress

LABEL maintainer="deck.david@gmail.com" \
      chocolatey.version="0.10.15"
