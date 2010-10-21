#!/bin/sh

IVY_BASE=/var/www/localhost/htdocs/ivy;
D=`date +%Y%m%e%H%M%S`;

for jar in `ls *.jar`
do
    module=`echo "${jar}" | sed 's/\.jar//g'`
    if [ ! -d "${IVY_BASE}/${module}.${1}" ]; then
        mkdir "${IVY_BASE}/${module}.${1}"
    fi

    if [ ! -f "${IVY_BASE}/${module}.${1}/ivy.xml" ]; then
        echo "<ivy-module version=\"2.0\">" >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "    <info"                    >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "       organisation=\"SSC\""  >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "       module=\"${module}\""  >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "       revision=\"${1}\""     >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "       publication=\"${D}\"/>" >> "${IVY_BASE}/${module}.${1}/ivy.xml"
        echo "</ivy-module>"                >> "${IVY_BASE}/${module}.${1}/ivy.xml"
    fi

    cp "${jar}" "${IVY_BASE}/${module}.${1}/${module}.jar"
done

