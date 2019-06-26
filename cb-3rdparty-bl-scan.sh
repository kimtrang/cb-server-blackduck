#!/bin/bash 
# Black Duck v2019.4.1

#!/bin/bash

export WORKSPACE=$(pwd)
rm -rf ${WORKSPACE}/thirdparty-src
mkdir -p ${WORKSPACE}/thirdparty-src/deps/go/src
cd ${WORKSPACE}/thirdparty-src/deps

echo "dep init ..."
/usr/local/go/bin/dep init

pwd; ls -la

cd ${WORKSPACE}/thirdparty-src/deps/go/src

#git clone git://github.com/couchbasedeps/breakpad.git
#git clone git://github.com/couchbasedeps/grpc.git
git clone git://github.com/couchbasedeps/flatbuffers.git
#git clone git://github.com/couchbasedeps/protoc-gen-go.git
export GOROOT=/usr/local/go
export GOPATH=${WORKSPACE}/thirdparty-src/deps/
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#export PATH=$PATH:/usr/local/go/bin
bash <(curl -s https://detect.synopsys.com/detect.sh) \
--detect.risk.report.pdf=false \
--detect.notices.report=false \
--detect.project.name=CBServer \
--detect.project.version.name=6.5.0 \
--detect.project.codelocation.prefix=CBServer \
--detect.source.path=${WORKSPACE}/thirdparty-src/deps/go/src \
--detect.go.dep.path=/usr/local/go/bin/go \
--detect.go.run.dep.init=true \
--detect.cleanup=true \
--detect.report.timeout=1800000000 \
--detect.pipenv.path=/usr/local/bin/pipenv \
--detect.cpan.path=/usr/bin/cpan \
--detect.cpanm.path=/usr/local/bin/cpanm \
--detect.go.dep.path=/usr/local/go/bin/dep \
--detect.maven.path=/usr/local/src/apache-maven/bin/mvn \
--detect.npm.path=/usr/bin/npm \
--detect.pear.path=/usr/bin/pear \
--detect.detector.search.depth=9 \
--detect.excluded.detector.types=CPAN,MAVEN,NPM,NUGET,PEAR,PIP,GRADLE \
--logging.level.com.synopsys.integration=DEBUG \
--blackduck.url=https://blackduck.build.couchbase.com \
--blackduck.username=sysadmin \
--blackduck.password=blackduck \
--blackduck.trust.cert=true
