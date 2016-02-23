#!/bin/sh

#CLASSPATH
if [ -f "${CONFIG_HOME}" ]; then CONFIG_HOME="/webapps/config"; fi
CLASSPATH="${CONFIG_HOME}"

#Option Tomcat
JMX_OPTS="-Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=3334 -Dorg.apache.cxf.stax.allowInsecureParser=1"
JVM_OPTS="-Xms512m -Xmx1536m -XX:PermSize=512m -XX:MaxPermSize=1024m -Djava.net.preferIPv4Stack=true"
DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8002"
APP_OPTS="-Dtomcat.instance.name=tomcat_localhost"

export CATALINA_OPTS="$JVM_OPTS $JMX_OPTS $APP_OPTS $DEBUG_OPTS"

