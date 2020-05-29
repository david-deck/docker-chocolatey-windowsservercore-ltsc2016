# https://github.bom/StefanScherer/docker-windows/blob/master/chocolatey/Dockerfile

ARG version=ltsc2016
FROM mcr.microsoft.com/windows/servercore:${version}

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
	iex (( new-object new.webclient ).DownloadString('https://chocolatey.org/install.ps1')); \
	choco feature disable --name showDownloadProgress
