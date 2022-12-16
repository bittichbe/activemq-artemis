# bash prepare-docker.sh --from-release --artemis-version 2.20.0            
# cd _TMP_/artemis/2.20.0                                                   

set -e
ARTEMIS_VERSION=$1 # 2.27.1
ARTCODED_VERSION=$2 # 2023.0.0-2_27_1-jre-18
bash prepare-docker.sh --from-release --artemis-version $ARTEMIS_VERSION     
cd ./_TMP_/artemis/$ARTEMIS_VERSION                                                            
docker build -f ./docker/Dockerfile-openjdk-18 -t nbittich/artemis:v$ARTCODED_VERSION .                                                                   
docker tag nbittich/artemis:v$ARTCODED_VERSION nbittich/artemis:v$ARTCODED_VERSION                                                                         
docker push nbittich/artemis:v$ARTCODED_VERSION   
cd -
rm -rf _TMP_/   