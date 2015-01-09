#!/bin/bash

if [ -z "${WEBAPPS_HOME}" ]; then WEBAPPS_HOME="/data/webapps"; fi

if [ ! -f /.tomcat_admin_created ]; then /create_tomcat_admin_user.sh; fi

if [ -f ${WEBAPPS_HOME}/*war ]; then
  cd ${WEBAPPS_HOME}
  for war in `ls *.war`
   do
     rm -rf ${CATALINA_HOME}/work/*
     rm -f ${CATALINA_HOME}/webapps/${war}
     webapp=`ls ${war} | cut -d'.' -f1`
     rm -rf ${CATALINA_HOME}/webapps/${webapp}
     mv ${war} ${CATALINA_HOME}/webapps/
   done
   cd /
fi

/usr/bin/redis-server /etc/redis/redis.conf

exec ${CATALINA_HOME}/bin/catalina.sh run
