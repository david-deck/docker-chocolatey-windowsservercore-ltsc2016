# https://github.bom/StefanScherer/docker-windows/blob/master/chocolatey/Dockerfile

ARG version=ltsc2016
FROM mcr.microsoft.com/windows/servercore:${version}

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
	iex ( (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1') ); \
	choco feature disable --name showDownloadProgress
