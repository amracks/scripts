#!/bin/sh
RUNTIMES="/usr/home/amrx/sys/lib/runtimes"
LIBDIR="/usr/home/amrx/ssc/c2tdgui/lib/sys"
COMPONENTS="BeanContext Display GeoCanvasMouseHandler GeoDomains IM JAFMenuSupport JAFSupport MS2525ShapeGenerator MapInterface Tags Types Utils ViewHost VisualMessageManager WindowlessViewHost"
#EXTJARS="OGC Geobject J2EE Log4j Servlet"


for pkg in ${COMPONENTS}
do
	latest=`ls ${RUNTIMES}/components/${pkg} | grep -v CVS | grep -v BRANCH | grep -v BETA | xargs | awk '{print $NF}'`
	cp ${RUNTIMES}/components/${pkg}/${latest}/lib/${pkg}.jar ${LIBDIR}
done


#for pkg in ${EXTJARS}
#do
#	latest=`ls ${RUNTIMES}/external/${pkg} | grep -v CVS | grep -v BRANCH | grep -v BETA | xargs | awk '{print $NF}'`
#	cp ${RUNTIMES}/external/${pkg}/${latest}/lib/*.jar ${LIBDIR}
#done
