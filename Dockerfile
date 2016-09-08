FROM hypriot/rpi-alpine-scratch

ENV SIAB_USERCSS="Normal:+/etc/shellinabox/options-enabled/00+Black-on-White.css,Reverse:-/etc/shellinabox/options-enabled/00_White-On-Black.css;Colors:+/etc/shellinabox/options-enabled/01+Color-Terminal.css,Monochrome:-/etc/shellinabox/options-enabled/01_Monochrome.css" \
  SIAB_PORT=4200 \
  SIAB_ADDUSER=true \
  SIAB_USER=siab \
  SIAB_USERID=1001 \
  SIAB_GROUP=siab \
  SIAB_GROUPID=1001 \
  SIAB_PASSWORD=putsafepasswordhere \
  SIAB_SHELL=/bin/bash \
  SIAB_HOME=/home/siab \
  SIAB_SUDO=false \
  SIAB_SSL=true \
  SIAB_SERVICE=/:LOGIN \
  SIAB_PKGS=none \
  SIAB_SCRIPT=none

ADD files/shellinabox.tar.gz /
ADD files/user-css.tar.gz /


RUN apk add --update bash openssl curl openssh-client sudo && rm -rf /var/cache/apk/* && \
   adduser -D -H -h /home/shellinabox shellinabox && mkdir /var/lib/shellinabox
#  ln -sf '/etc/shellinabox/options-enabled/00+Black on White.css' \
#    /etc/shellinabox/options-enabled/00+Black-on-White.css && \
#  ln -sf '/etc/shellinabox/options-enabled/00_White On Black.css' \
#    /etc/shellinabox/options-enabled/00_White-On-Black.css && \
#  ln -sf '/etc/shellinabox/options-enabled/01+Color Terminal.css' \
#    /etc/shellinabox/options-enabled/01+Color-Terminal.css


EXPOSE 4200

VOLUME /etc/shellinabox /var/log/supervisor /home

ADD files/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["shellinabox"]
