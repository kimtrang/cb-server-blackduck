#!/bin/bash 

export WORKSPACE=$(pwd)
mkdir -p ${WORKSPACE}/thirdparty-src/deps
cd ${WORKSPACE}/thirdparty-src/deps

git clone git://github.com/couchbasedeps/breakpad.git
git clone git://github.com/couchbasedeps/grpc.git
git clone git://github.com/couchbasedeps/depot_tools.git
git clone git://github.com/couchbasedeps/flatbuffers.git
git clone git://github.com/couchbasedeps/protoc-gen-go.git

export PATH=$PATH:/usr/local/go/bin
bash /home/couchbase/tools/Detect_Installation/detect.sh \
--detect.risk.report.pdf=false \
--detect.notices.report=false \
--detect.project.name=CBServer \
--detect.project.version.name=6.5.0 \
--detect.project.codelocation.prefix=CBServer \
--detect.source.path=${WORKSPACE}/thirdparty-src/deps \
--detect.go.dep.path=/usr/local/go/bin \
--detect.cleanup=true \
--detect.go.run.dep.init=false \
--detect.report.timeout=1800000000 \
--detect.detector.search.depth=9 \
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
