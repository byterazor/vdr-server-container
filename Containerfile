FROM alpine:latest

RUN apk update && apk add --no-cache vdr vdr-dvbapi vdr-epgsearch vdr-osd2web vdr-streamdev vdr-svdrpservice vdr-vnsiserver fontconfig 
