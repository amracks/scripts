#!/bin/sh

BUILD_DIR=~amrx/SSC/nightly
SHAREDNET_HOME=~/SSC/SharedNet/SharedNet-6.7.1.27
CHECKSTYLE_CHECK=~amrx/checkstyle/0417_checks.xml

TODAY=`date +%F`

PROJECTS="SNInjector:build:./src/jar:mil.navy.sninjector"
CVSROOT=":ext:amarks@avm26.spawar.navy.mil:/CVS/SWrepository"

WEB_ROOT="/var/www/localhost/htdocs/nb"
ARCHIVE_ROOT="/var/www/localhost/htdocs/nb-archives"

FUSION_VIEW_DIR="/var/www/localhost/htdocs/FusionView"

buildJavaProjectFile() {
    echo "<html><head><title>${projectName}</title><h2>${projectName} Build ${TODAY}</h2><hr></head><body>" > ${WEB_ROOT}/${projectName}.html
    echo "<a href=\"${projectName}_checkout.txt\">CVS Checkout Output</a><p>"               >> ${WEB_ROOT}/${projectName}.html
    echo "<a href=\"${projectName}_checkstyle.txt\">Checkstyle Output</a><p>"               >> ${WEB_ROOT}/${projectName}.html
    echo "<a href=\"${projectName}_build.txt\">Build Output</a><p>"                         >> ${WEB_ROOT}/${projectName}.html
    echo "<a href=\"${projectName}_javadoc.txt\">Javadoc Command Output</a><p>"             >> ${WEB_ROOT}/${projectName}.html
    echo "<a href=\"${projectName}_jd/index.html\">Javadoc API</a><p>"                      >> ${WEB_ROOT}/${projectName}.html
    echo "</body></html>"                                                                   >> ${WEB_ROOT}/${projectName}.html
}

export CVSROOT SHAREDNET_HOME

rm -rf ${WEB_ROOT}/*

mkdir ${BUILD_DIR}/build

echo "<html><head><title>Nightly Build</title><h2>0417 Nightly Build ${TODAY}</h2><hr></head><body>" > ${WEB_ROOT}/index.html

cd ${BUILD_DIR}/build

#Build Java Projects
for project in ${PROJECTS}
do
    projectName=`echo ${project} | awk -F: '{print $1}'`
    antTask=`echo ${project} | awk -F: '{print $2}'`
    sourceDir=`echo ${project} | awk -F: '{print $3}'`
    jDocPackages=`echo ${project} | awk -F: '{print $4}'`

    buildJavaProjectFile
    echo "<a href=\"${projectName}.html\">${projectName}</a><p>" >> ${WEB_ROOT}/index.html

    #Checkout
    cvs co ${projectName} > ${WEB_ROOT}/${projectName}_checkout.txt
    cd ${projectName}

    #Build
    ant ${antTask} > ${WEB_ROOT}/${projectName}_build.txt 

    #Checkstyle
    checkstyle -c ${CHECKSTYLE_CHECK} -r ${sourceDir} > ${WEB_ROOT}/${projectName}_checkstyle.txt

    #Javadoc
    javadoc -d ${WEB_ROOT}/${projectName}_jd \
        -use \
        -splitIndex \
        -sourcepath ${sourceDir} \
        -subpackages ${jDocPackages} > ${WEB_ROOT}/${projectName}_javadoc.txt
done


#Build FusionView
cd ${FUSION_VIEW_DIR}

cvs -q update -dP > ${WEB_ROOT}/FusionView_update.txt
./bin/build.pl > ${WEB_ROOT}/FusionView_build.txt

echo "<html><head><title>FusionView</title><h2>FusionView Build ${TODAY}</h2><hr></head><body>" > ${WEB_ROOT}/FusionView.html
echo "<a href=\"FusionView_update.txt\">CVS Update</a><p>"  >> ${WEB_ROOT}/FusionView.html
echo "<a href=\"FusionView_build.txt\">Build Output</a><p>" >> ${WEB_ROOT}/FusionView.html
echo "<a href=\"/FusionView\">Web Application</a><p>"       >> ${WEB_ROOT}/FusionView.html
echo "</body></html>"                                       >> ${WEB_ROOT}/FusionView.html

echo "<a href=\"FusionView.html\">FusionView</a><p>" >> ${WEB_ROOT}/index.html


echo "<hr><a href=\"/nb-archives\">Archives</a><p>" >> ${WEB_ROOT}/index.html
echo "</body></html>" >> ${WEB_ROOT}/index.html

rm -rf ${BUILD_DIR}/build

mkdir ${ARCHIVE_ROOT}/${TODAY}
cp -R ${WEB_ROOT}/* ${ARCHIVE_ROOT}/${TODAY}


echo "<html><head><title>Nightly Build Archives</title><h2>Nightly Build Archives</h2><hr></head><body>" > ${ARCHIVE_ROOT}/index.html
for dir in `ls -p ${ARCHIVE_ROOT} | grep \/`
do
    dirName=`echo $dir | sed -s 's/\///'`
    echo "<a href=\"$dirName\">$dirName</a><p>" >> ${ARCHIVE_ROOT}/index.html
done

echo "</body></html>" >> ${ARCHIVE_ROOT}/index.html
