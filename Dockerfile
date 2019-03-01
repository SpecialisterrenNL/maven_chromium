FROM maven:3.5-jdk-9-slim

LABEL version="0.1.0"

#Based on best practice of docker.com
RUN apt-get update && apt-get install -y \
	zip \
	unzip \
	chromium \
	xvfb \
&& rm -rf /var/lib/apt/lists/*

#Based on https://github.com/mark-adams/docker-chromium-xvfb/blob/master/images/base/Dockerfile
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN chmod +x /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

