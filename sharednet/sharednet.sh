#!/bin/bash

#Settins
SNH_BASE=~/SharedNet
SN_VERSION=`ls -d ${SNH_BASE}/SharedNet* | awk -F- '{print $2}' | sort -t. -k 4 -n | xargs | awk '{print $NF}'`
DEBUG="false"
#HOSTNAME=$HOSTNAME
SN_ADMINCLIENT="sn_adminclient_${HOSTNAME}"
MYSQL_HOME="/var/db/mysql"
SQL_USER="root"
SQL_PASSWORD="cubemonster"

TOMS_SERVER_GROUP="group"
TOMS_SERVER_TIMEOUT="90"
TOMS_SERVER_PORT="8443"
TOMS_SERVER_PROTO="http"

TOMS_GUI_SERVER_URL="http://localhost/axis/services/handleMessage"
TOMS_GUI_SERVER11_URL="http://localhost/axis/services/TOMS"
TOMS_GUI_PORT=8091
TOMS_GUI_SERVICE_NAME=handleMessage
TOMS_GUI_UNIQE_NAME=unique
TOMS_GUI_TIMEOUT=90
 

SERVER_JARS="SHANET_core.jar 
             SHANET_OM_beans.jar 
             SHANET_comm.jar 
             SHANET_storeServer.jar 
             wrapper.jar 
             antlr.jar 
             clopt.jar
             SHANET_dtn.jar
             dtn-api.jar"

CONFIG_JARS="SHANET_configurationGUI.jar clopt.jar"

TOMS_BASE_JARS="SHANET_core.jar 
                  SHANET_comm.jar 
                  SHANET_toms.jar 
                  saaj.jar 
                  commons-discovery.jar 
                  commons-logging.jar 
                  commons-cli.jar"

TOMS_SERVER03_JARS=" SHANET_OM_beans.jar
                     SHANET_XTap.jar
                     antlr.jar
                     xercesImpl.jar
                     activation.jar
                     mail.jar
                     clopt.jar
                     jaxrpc.jar
                     axis.jar"

TOMS_SERVER04_JARS="SHANET_OM_beans.jar
                    SHANET_XTap.jar
                    antlr.jar
                    xercesImpl.jar
                    activation.jar
                    mail.jar
                    clopt.jar
                    nces-sdk-axis-spi-0.4.3.jar
                    nces-commons-0.4.3.jar
                    nces-sdk-0.4.3.jar
                    wss4j-1.5.0.jar
                    xmlsec-1.4.Beta0.jar
                    log4j-1.2.13.jar
                    jaxrpc.jar
                    axis.jar"


TOMS_SERVER05_JARS="SHANET_OM_beans.jar
                    SHANET_XTap.jar
                    antlr.jar
                    xercesImpl.jar
                    activation.jar
                    mail.jar
                    clopt.jar
                    nces-sdk-axis-spi-0.4.3.jar
                    nces-commons-0.4.3.jar
                    nces-sdk-0.4.3.jar
                    wss4j-1.5.0.jar
                    xmlsec-1.4.Beta0.jar
                    log4j-1.2.13.jar
                    jaxrpc-axis1.2b.jar
                    xml-apis.jar
                    xalan-2.7.0.jar
                    jug.jar
                    commons-lang-2.0.jar
                    axis-1.2b.jar"

TOMS_SERVER10_JARS="SHANET_core.jar
                    SHANET_comm.jar
                    SHANET_OM_beans.jar
                    SHANET_toms.jar
                    SHANET_XTap.jar
                    antlr.jar
                    xercesImpl.jar
                    activation.jar
                    mail.jar
                    clopt.jar
                    jug.jar
                    commons-cli.jar
                    xml-apis.jar"

TOMS_SERVER10_NCES_JARS="axis-1.2b.jar
                    castor-0.9.5.3-xml-no-xsi.jar
                    commons-collections-3.0.jar
                    commons-discovery-0.2.jar
                    commons-httpclient-2.0.jar
                    commons-lang-2.0.jar
                    commons-logging-1.0.3.jar
                    jaxrpc-axis1.2b.jar
                    log4j-1.2.8.jar
                    nces-commons-0.4.3.jar
                    nces-sdk-0.4.3.jar
                    nces-sdk-axis-samples-0.4.3.jar
                    nces-sdk-axis-spi-0.4.3.jar
                    saaj-axis1.2b.jar
                    security-services-0.3-client.jar
                    security-services-specs-0.3.jar
                    servletapi-2.3.jar
                    soapkit-0.11.jar
                    sunxacml-1.1.jar
                    unannoyment-0.3.jar
                    wsdl4j-1.5.jar
                    wss4j-1.0-dev.jar
                    xmlsec-1.1.0-patched.jar
                    xalan-2.6.0.jar
                    discovery-services-0.3-client.jar"

TOMS_SERVER11_JARS="SHANET_core.jar
            SHANET_comm.jar
            SHANET_OM_beans.jar
            SHANET_toms.jar
            SHANET_XTap.jar
            antlr.jar
            xercesImpl.jar
            activation.jar
            mail.jar
            clopt.jar
            jug.jar
            commons-cli.jar
            xml-apis.jar"

TOMS_SERVER12_JARS="SHANET_core.jar
            SHANET_comm.jar
            SHANET_OM_beans.jar
            SHANET_toms.jar
            SHANET_XTap.jar
            antlr.jar
            xercesImpl.jar
            activation.jar
            mail.jar
            clopt.jar
            jug.jar
            commons-cli.jar
            xml-apis.jar"


TOMS_SERVER14_JARS="SHANET_core.jar
            SHANET_comm.jar
            SHANET_OM_beans.jar
            SHANET_toms.jar
            SHANET_XTap.jar
            antlr.jar
            xercesImpl.jar
            activation.jar
            mail.jar
            clopt.jar
            jug.jar
            commons-cli.jar
            xml-apis.jar"


TOMS_SERVER11_NCES_JARS="axis-1.2b.jar
                 castor-0.9.5.3-xml-no-xsi.jar
                 commons-collections-3.0.jar
                 commons-discovery-0.2.jar
                 commons-httpclient-2.0.jar
                 commons-lang-2.0.jar
                 commons-logging-1.0.3.jar
                 jaxrpc-axis1.2b.jar
                 log4j-1.2.8.jar
                 nces-commons-0.4.3.jar
                 nces-sdk-0.4.3.jar
                 nces-sdk-axis-samples-0.4.3.jar
                 nces-sdk-axis-spi-0.4.3.jar
                 saaj-axis1.2b.jar
                 security-services-0.3-client.jar
                 security-services-specs-0.3.jar
                 servletapi-2.3.jar
                 soapkit-0.11.jar
                 sunxacml-1.1.jar
                 unannoyment-0.3.jar
                 wsdl4j-1.5.jar
                 wss4j-1.0-dev.jar
                 xmlsec-1.1.0-patched.jar
                 xalan-2.6.0.jar
                 discovery-services-0.3-client.jar"

TOMS_SERVER12_NCES_JARS="axis-1.2b.jar
                 castor-0.9.5.3-xml-no-xsi.jar
                 commons-collections-3.0.jar
                 commons-discovery-0.2.jar
                 commons-httpclient-2.0.jar
                 commons-lang-2.0.jar
                 commons-logging-1.0.3.jar
                 jaxrpc-axis1.2b.jar
                 log4j-1.2.8.jar
                 nces-commons-0.4.3.jar
                 nces-sdk-0.4.3.jar
                 nces-sdk-axis-samples-0.4.3.jar
                 nces-sdk-axis-spi-0.4.3.jar
                 saaj-axis1.2b.jar
                 security-services-0.3-client.jar
                 security-services-specs-0.3.jar
                 servletapi-2.3.jar
                 soapkit-0.11.jar
                 sunxacml-1.1.jar
                 unannoyment-0.3.jar
                 wsdl4j-1.5.jar
                 wss4j-1.0-dev.jar
                 xmlsec-1.1.0-patched.jar
                 xalan-2.6.0.jar
                 discovery-services-0.3-client.jar"

TOMS_SERVER14_NCES_JARS="axis-1.2b.jar
                 castor-0.9.5.3-xml-no-xsi.jar
                 commons-collections-3.0.jar
                 commons-discovery-0.2.jar
                 commons-httpclient-2.0.jar
                 commons-lang-2.0.jar
                 commons-logging-1.0.3.jar
                 jaxrpc-axis1.2b.jar
                 log4j-1.2.8.jar
                 nces-commons-0.4.3.jar
                 nces-sdk-0.4.3.jar
                 nces-sdk-axis-samples-0.4.3.jar
                 nces-sdk-axis-spi-0.4.3.jar
                 saaj-axis1.2b.jar
                 security-services-0.3-client.jar
                 security-services-specs-0.3.jar
                 servletapi-2.3.jar
                 soapkit-0.11.jar
                 sunxacml-1.1.jar
                 unannoyment-0.3.jar
                 wsdl4j-1.5.jar
                 wss4j-1.0-dev.jar
                 xmlsec-1.1.0-patched.jar
                 xalan-2.6.0.jar
                 discovery-services-0.3-client.jar"


TOMS_GUI03_JARS="jaxrpc.jar axis.jar"

    
TOMS_GUI04_JARS="xercesImpl.jar
                 activation.jar
                 mail.jar
                 nces-sdk-axis-spi-0.4.3.jar
                 nces-commons-0.4.3.jar
                 nces-sdk-0.4.3.jar
                 wss4j-1.5.0.jar
                 xmlsec-1.4.Beta0.jar
                 log4j-1.2.13.jar
                 jaxrpc.jar
                 axis.jar"
 
    
TOMS_GUI05_JARS="xercesImpl.jar
                 activation.jar
                 mail.jar
                 nces-sdk-axis-spi-0.4.3.jar
                 nces-commons-0.4.3.jar
                 nces-sdk-0.4.3.jar
                 wss4j-1.5.0.jar
                 xmlsec-1.4.Beta0.jar
                 log4j-1.2.13.jar
                 axis-1.2b.jar
                 jaxrpc-axis1.2b.jar
                 xml-apis.jar
                 xalan-2.7.0.jar
                 jug.jar
                 commons-lang-2.0.jar"

TOMS_GUI10_JARS="SHANET_core.jar
                 SHANET_comm.jar
                 SHANET_OM_beans.jar
                 SHANET_toms.jar
                 commons-cli.jar
                 xercesImpl.jar
                 activation.jar
                 mail.jar
                 xml-apis.jar
                 jug.jar
                 clopt.jar"

TOMS_GUI10_NCES_JARS="axis-1.2b.jar
                      castor-0.9.5.3-xml-no-xsi.jar
                      commons-collections-3.0.jar
                      commons-discovery-0.2.jar
                      commons-httpclient-2.0.jar
                      commons-lang-2.0.jar
                      commons-logging-1.0.3.jar
                      jaxrpc-axis1.2b.jar
                      log4j-1.2.8.jar
                      nces-commons-0.4.3.jar
                      nces-sdk-0.4.3.jar
                      nces-sdk-axis-samples-0.4.3.jar
                      nces-sdk-axis-spi-0.4.3.jar
                      saaj-axis1.2b.jar
                      security-services-0.3-client.jar
                      security-services-specs-0.3.jar
                      servletapi-2.3.jar
                      soapkit-0.11.jar
                      sunxacml-1.1.jar
                      unannoyment-0.3.jar
                      wsdl4j-1.5.jar
                      wss4j-1.0-dev.jar
                      xmlsec-1.1.0-patched.jar
                      xalan-2.6.0.jar
                      discovery-services-0.3-client.jar"


    
function initENV() {
    #Set Sharednet Home Dir
    SHAREDNET_HOME="${SNH_BASE}/SharedNet-${SN_VERSION}"

    #Set Config Path (I guess Sharednet needs This)
    CONFIG_PATH="${SHAREDNET_HOME}/data/config"

    #find and set java version to use
    #java_hint=`echo ${SN_VERSION} | awk -F\. '{print $2}'`
    #if [ ${java_hint} -gt 4 ]; then
    #    JAVA=${J5_HOME}/bin/java
    #    JAVA_HOME=${J5_HOME}
    #else
    #    JAVA=${J4_HOME}/bin/java
    #    JAVA_HOME=${J4_HOME}
    #fi

    JAVA=$JAVA_HOME/bin/java

    if [ ${DEBUG} == "true" ]; then
        printf "Sharednet Home:\t${SHAREDNET_HOME}\n"
        printf "Config Path:\t${CONFIG_PATH}\n"
        printf "JAVA HOME:\t${JAVA_HOME}\n"
    fi
}

function buildClasspath() {
  
    #Build Classpath
    for jar in ${1}
    do
        if [ ${CP} ]; then
            CP=${CP}:${SHAREDNET_HOME}/lib/${jar}
        else
            CP=${SHAREDNET_HOME}/lib/${jar}
        fi
    done

    if [ ${DEBUG} == "true" ]; then
        printf "CLASSPATH:\t${CP}\n"
    fi
}

function ncesClasspath() {
  
    #Build Classpath
    for jar in ${1}
    do
        if [ ${CP} ]; then
            CP=${CP}:${SHAREDNET_HOME}/nceslib/${jar}
        else
            CP=${SHAREDNET_HOME}/nceslib/${jar}
        fi
    done

    if [ ${DEBUG} == "true" ]; then
        printf "CLASSPATH:\t${CP}\n"
    fi
}

function startServer () {
    initENV
    clearLogs
  
    buildClasspath "${SERVER_JARS}"

    #print some dbugging statements
    if [ ${DEBUG} == "true" ]; then
        printf "\nRun Command:\n----------------------\n
            ${JAVA} -cp ${CP}\n
                -Xmx512m \n
                ${SN_DEBUG} \n
                ${SN_MANAGE} \n
                -DAPP_NAME=ea \n
                -DWS_NAME=${HOSTNAME} \n
                -DSHAREDNET_HOME=${SHAREDNET_HOME} \n
                -DSN_LOG_LEVEL=${SN_LOG_LEVEL}  \n
                -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \n
                -DSN_JAVA_HOME=${JAVA_HOME} \n
                -DSQL_NAME="user" \n
                -DSQL_PASSWORD="CubeM0nster" \n
                -DSN_MANUAL_CIR=${SN_MANUAL_CIR}  \n
                gov.nasa.jpl.sharednet.app.server.ServerGUI ${CONFIG_PATH} &\n"
    fi

    printf "*----------------------------------------------------*\n"
    printf "*            SharedNet Server ${SN_VERSION}                *\n"
    printf "*----------------------------------------------------*\n"

${JAVA} -cp ${CP}\
    -Xmx512m \
    ${SN_DEBUG} \
    ${SN_MANAGE} \
    -DAPP_NAME=ea \
    -DWS_NAME=${HOSTNAME} \
    -DSHAREDNET_HOME=${SHAREDNET_HOME} \
    -DSN_LOG_LEVEL=${SN_LOG_LEVEL}  \
    -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
    -DSN_JAVA_HOME=${JAVA_HOME} \
    -DSQL_NAME="${SQL_USER}" \
    -DSQL_PASSWORD="${SQL_PASSWORD}" \
    -DSN_MANUAL_CIR=${SN_MANUAL_CIR}  \
    -DSERVER=${SN_SERVER} \
    -DSN_SERVER=${SN_SERVER} \
    gov.nasa.jpl.sharednet.app.server.ServerGUI ${CONFIG_PATH} &

}

function configGui () {
    initENV

    buildClasspath "${CONFIG_JARS}"
        
    printf "*----------------------------------------------------*\n"
    printf "*            SharedNet Config ${SN_VERSION}                *\n"
    printf "*----------------------------------------------------*\n"

    if [ ${DEBUG} == "true" ]; then
        "${JAVA} -cp ${CP} \n
            -DAPP_NAME=SNConfigEditor \n
            -DSN_DEBUG=  \n
            -DSN_LOG_LEVEL=  \n
            -DWS_NAME=${HOSTNAME} \n
            -DSHAREDNET_HOME=${SHAREDNET_HOME} \n
            -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \n
            gov.nasa.jpl.sharednet.tools.configuration.ConfigurationEditorMain"
    fi

    ${JAVA} -cp ${CP} \
        -DAPP_NAME=SNConfigEditor \
        -DSN_DEBUG=  \
        -DSN_LOG_LEVEL=  \
        -DWS_NAME=${HOSTNAME} \
        -DSHAREDNET_HOME=${SHAREDNET_HOME} \
        -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
        gov.nasa.jpl.sharednet.tools.configuration.ConfigurationEditorMain &
}

function tomsServer () {
    initENV

    jpanelOveride=""

    toms_version_major=`echo ${SN_VERSION} | awk -F\. '{print $3}'`
    toms_version_minor=`echo ${SN_VERSION} | awk -F\. '{print $4}'`
    case ${toms_version_major} in
	0)
    	case ${toms_version_minor} in
            3) buildClasspath "${TOMS_BASE_JARS} ${TOMS_SERVER03_JARS}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TrackObjectManagementService
               jpanelOveride="-Xbootclasspath/p:/Users/amrx/SSC/src/jframe";;
            4) buildClasspath "${TOMS_BASE_JARS} ${TOMS_SERVER04_JARS}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TrackObjectManagementService;;
            5) buildClasspath "${TOMS_BASE_JARS} ${TOMS_SERVER05_JARS}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TrackObjectManagementService;;
        esac
	;;
	1)
    	case ${toms_version_minor} in
            0) buildClasspath "${TOMS_BASE_JARS} ${TOMS_SERVER10_JARS}"
               ncesClasspath "${TOMS_SERVER10_NCES_JARS}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TrackObjectManagementService;;
            1) buildClasspath "${TOMS_SERVER11_JARS}"
               ncesClasspath "${TOMS_SERVER11_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            2) buildClasspath "${TOMS_SERVER12_JARS}"
               ncesClasspath "${TOMS_SERVER12_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            4) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            5) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService
               jpanelOveride="-Xbootclasspath/p:/Users/amrx/SSC/src/jframe";;
            6) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService
               jpanelOveride="-Xbootclasspath/p:/Users/amrx/SSC/src/jframe";;
            9) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            10) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            11) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            12) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            13) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            14) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            15) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            17) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            19) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            21) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            22) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            27) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            36) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
            38) buildClasspath "${TOMS_SERVER14_JARS}"
               ncesClasspath "${TOMS_SERVER14_NCES_JARS}" 
               gifInfo="-DSN_GIF_PATH=${SN_GIF_PATH} -DSN_GIF_PORT=${SN_GIF_PORT}"
               tomsclass=""gov.nasa.jpl.sharednet.toms.server.TranslationObjectManagementService;;
	    esac
	;;
    esac

    printf "*----------------------------------------------------*\n"
    printf "*            SharedNet TOMS Server ${SN_VERSION}           *\n"
    printf "*----------------------------------------------------*\n"

    CP=${CP}:${SHAREDNET_HOME}/data/toms

    if [ ${DEBUG} == "true" ]; then

        echo "${JAVA} \
            -server \
            -Xmx1000m \
            ${SN_DEBUG} \
            -cp ${CP}  \
            ${jpanelOveride} \
            -DAPP_NAME=SNTOMSServer \
            -DWS_NAME=${HOSTNAME} \
            -DSN_LOG_LEVEL=${SN_LOG_LEVEL} \
            -DSHAREDNET_HOME=${SHAREDNET_HOME} \
            -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
            ${gifInfo} \
            -Djavax.net.debug=ssl:handshake:verbose \
            -Djavax.net.ssl.trustStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
            -Djavax.net.ssl.keyStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
            -Djavax.net.ssl.keyStorePassword=password \
             ${tomsclass}\
            -p ${TOMS_SERVER_PORT} \
            -t ${TOMS_SERVER_TIMEOUT} \
            -g ${TOMS_SERVER_GROUP} \
            -h ${TOMS_SERVER_PROTO} &"
        

    fi

    ${JAVA} \
        -server \
        -Xmx1000m \
        ${SN_DEBUG} \
        -cp ${CP}  \
        ${jpanelOveride} \
        -DAPP_NAME=SNTOMSServer \
        -DWS_NAME=${HOSTNAME} \
        -DSN_LOG_LEVEL=${SN_LOG_LEVEL} \
        -DSHAREDNET_HOME=${SHAREDNET_HOME} \
        -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
        ${gifInfo} \
        -Djavax.net.debug=ssl:handshake:verbose \
        -Djavax.net.ssl.trustStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
        -Djavax.net.ssl.keyStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
        -Djavax.net.ssl.keyStorePassword=password \
         ${tomsclass}\
        -p ${TOMS_SERVER_PORT} \
        -t ${TOMS_SERVER_TIMEOUT} \
        -g ${TOMS_SERVER_GROUP} \
        -h ${TOMS_SERVER_PROTO} &
    

}

function tomsGui() {
    initENV

    toms_version_major=`echo ${SN_VERSION} | awk -F\. '{print $3}'`
    toms_version_minor=`echo ${SN_VERSION} | awk -F\. '{print $4}'`
    case ${toms_version_major} in
	0)
            case ${toms_version_minor} in
        	3) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI03_JARS}" 
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TrackInformationGUI";;
        	4) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI04_JARS}" 
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TrackInformationGUI";;
        	5) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI05_JARS}" 
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TrackInformationGUI";;
	    esac
	    ;;
	1)
        case ${toms_version_minor} in
        	0) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TrackInformationGUI";;
        	1) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	2) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	4) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	5) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	6) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	9) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	11) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	12) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	14) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	15) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	17) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	19) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	21) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
        	22) buildClasspath "${TOMS_BASE_JARS} ${TOMS_GUI10_JARS}" 
		        ncesClasspath "${TOMS_GUI10_NCES_JARS}"
                gui_class="gov.nasa.jpl.sharednet.toms.client.gui.TranslationInformationGUI"
                TOMS_GUI_SERVER_URL=${TOMS_GUI_SERVER11_URL};;
	    esac
        ;;
    esac


    printf "*----------------------------------------------------*\n"
    printf "*            SharedNet TOMS Gui    ${SN_VERSION}           *\n"
    printf "*----------------------------------------------------*\n"

    CP=${CP}:${SHAREDNET_HOME}/data/toms

${JAVA} \
    ${SN_DEBUG} \
    -Xmx512m \
    -cp ${CP} \
    -DAPP_NAME=SNTOMSGUI \
    -DWS_NAME=${HOSTNAME} \
    -DSN_LOG_LEVEL=${SN_LOG_LEVEL} \
    -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
    -Djavax.net.debug=ssl:handshake:verbose \
    -Djavax.net.ssl.trustStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
    -Djavax.net.ssl.keyStore=${SHAREDNET_HOME}/data/toms/service-consumer.jks \
    -Djavax.net.ssl.keyStorePassword=password \
    ${gui_class} \
    -s ${TOMS_GUI_SERVER_URL} \
    -u ${TOMS_GUI_UNIQE_NAME} \
    -t ${TOMS_GUI_TIMEOUT} \
    -p ${TOMS_GUI_PORT} \
    -n ${TOMS_GUI_SERVICE_NAME} &
    #tester


}

function startStoreBrowser() {
    initENV

    echo '*----------------------------------------------------*' 
    echo '*            SharedNet Store Browser                 *'
    echo '*----------------------------------------------------*' 

CP=${SHAREDNET_HOME}/lib/SHANET_OM_beans.jar
CP=${CP}:${SHAREDNET_HOME}/lib/SHANET_storeBrowser.jar
CP=${CP}:${SHAREDNET_HOME}/lib/SHANET_dtn.jar
CP=${CP}:${SHAREDNET_HOME}/lib/dtn-api.jar
CP=${CP}:${SHAREDNET_HOME}/lib/clopt.jar

${JAVA} -cp ${CP} \
    -Xmx500m \
    -DAPP_NAME=SNBrowser \
    -DWS_NAME=${HOSTNAME} \
    -DSHAREDNET_HOME=${SHAREDNET_HOME} \
    -DSHAREDNET_NS="data/config" \
    -DSN_LOG_LEVEL= \
    -DSN_LOG_DIR=${SHAREDNET_HOME}/logs \
    gov.nasa.jpl.sharednet.tools.store_browser.ViewStoreMain &

}

function clearLogs() {
    initENV
    rm -rf ${SHAREDNET_HOME}/logs/*log*
}

while getopts v:stbgcdl option
do
    case ${option} in
        v)
            SN_VERSION=${OPTARG}
            ;;
        s)
            startServer
            ;;
        c)
            configGui
            ;;
        t)
            tomsServer
            ;;
        g)
            tomsGui
            ;;
        b)
            startStoreBrowser
            ;;
        d)
            DEBUG="true";;
        l)
            clearLogs
            ;;
        ?)
            printf "Usage: %s: [-v version] [-d] -s|-t|-b|-g|-l\n" $0
            printf "\t-v\tSharedNet Version to use\n"
            printf "\t-s\tStart the Server\n"
            printf "\t-t\tStart the Toms Server\n"
            printf "\t-b\tStart the Store Browser\n"
            printf "\t-g\tStart the Toms Gui\n"
            printf "\t-l\tClear the log flies (Automatically done on Server Startup)\n"
        exit;;
    esac
done
