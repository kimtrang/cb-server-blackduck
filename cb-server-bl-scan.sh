#!/bin/bash

export WORKSPACE=$(pwd)/scansrc
if [ ! -z ${WORKSPACE} ]; then
    mkdir -p ${WORKSPACE}
fi

cd ${WORKSPACE}

repo init -u git://github.com/couchbase/manifest  -m couchbase-server/mad-hatter.xml -g build,default
repo sync --jobs=6

export PATH=$PATH:/usr/local/go/bin
bash /home/couchbase/tools/Detect_Installation/detect.sh \
--detect.risk.report.pdf=false \
--detect.notices.report=false \
--detect.project.name=CBServer \
--detect.project.version.name=6.5.0 \
--detect.project.codelocation.prefix=CBServer \
--detect.source.path=${WORKSPACE}/scansrc \
--detect.go.dep.path=/usr/local/go/bin \
--detect.cleanup=true \
--detect.report.timeout=1800000000 \
--detect.detector.search.depth=9 \
--detect.nuget.ignore.failure=true \
--detect.pipenv.path=/usr/local/bin/pipenv \
--detect.cpan.path=/usr/bin/cpan \
--detect.cpanm.path=/usr/local/bin/cpanm \
--detect.go.dep.path=/usr/local/go/bin/dep \
--detect.maven.path=/usr/local/src/apache-maven/bin/mvn \
--detect.npm.path=/usr/bin/npm \
--detect.pear.path=/usr/bin/pear \
--logging.level.com.synopsys.integration=DEBUG \
--blackduck.url=https://blackduck.build.couchbase.com \
--blackduck.username=xxxx \
--blackduck.password=xxxx \
--blackduck.trust.cert=true 
