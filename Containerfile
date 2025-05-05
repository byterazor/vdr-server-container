FROM alpine:latest as builder

RUN apk update && apk add --no-cache git make gcc musl-dev

WORKDIR /src

RUN git clone https://github.com/ossobv/syslog2stdout.git
RUN cd syslog2stdout && make syslog2stdout && ls -al

FROM alpine:latest

RUN apk update && apk add --no-cache vdr vdr-dvbapi vdr-epgsearch vdr-osd2web vdr-streamdev vdr-svdrpservice vdr-vnsiserver fontconfig 

COPY --from=builder /src/syslog2stdout/syslog2stdout /usr/local/bin/