FROM ghcr.io/linuxserver/webtop

ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/London
ENV PATH=/jason-bin-3.2.0/bin/:/gradle-7.3/bin:$PATH

RUN apk add openjdk17

RUN wget https://services.gradle.org/distributions/gradle-7.3-bin.zip && \
    unzip gradle-7.3-bin.zip
    
RUN wget --user-agent="Mozilla/5.0" \
    https://github.com/jason-lang/jason/releases/download/3.2.0/jason-bin-3.2.0.zip && \
    unzip jason-bin-3.2.0.zip -d jason-bin-3.2.0 

RUN rm -rf *.zip 

COPY ./jason /config/jason

WORKDIR /config/projects

EXPOSE 3000
