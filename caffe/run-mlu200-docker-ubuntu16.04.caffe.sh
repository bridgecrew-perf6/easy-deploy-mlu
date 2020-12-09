#/bin/bash
set -e

#Image name
MY_IMAGES="cambricon/scm/dockerfile/mlu270_v1.5.0_ubuntu16.04.caffe:v1.0"
#Docker container name
MY_CONTAINER="mlu200_container-ubuntu16.04.caffe-v1.5.0"

#####Modify according to your development environment#####
#SDK path on the host
PATH_FTP_HOST="/data/ftp/v1.5.0"
#Work path on the docker container
PATH_FTP_DOCKER="/home/ftp"
#Datasets path on the host
PATH_DATASETS_HOST="/data/datasets"
#Datasets path on the docker container
PATH_DATASETS_DOCKER="/data/datasets"
#Models path on the host
PATH_MODELS_HOST="/data/models"
#Models path on the docker container
PATH_MODELS_DOCKER="/data/models"
#Share path on the host
PATH_SHARE_HOST="$PWD"
#Share path on the docker container
PATH_SHARE_DOCKER="/home/share"


##########################################################

num=`sudo docker ps -a|grep -w "$MY_CONTAINER$"|wc -l`

echo $num
echo $MY_CONTAINER

if [ 0 -eq $num ];then
    #sudo xhost +
    sudo docker run -e DISPLAY=unix$DISPLAY --privileged=true \
        --device /dev/cambricon_c10Dev0 --net=host --pid=host \
        -v /sys/kernel/debug:/sys/kernel/debug \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -it -v $PATH_FTP_HOST:$PATH_FTP_DOCKER \
        -it -v $PATH_DATASETS_HOST:$PATH_DATASETS_DOCKER \
        -it -v $PATH_MODELS_HOST:$PATH_MODELS_DOCKER \
        -it -v $PATH_SHARE_HOST:$PATH_SHARE_DOCKER \
        --name $MY_CONTAINER $MY_IMAGES /bin/bash
else
    sudo docker start $MY_CONTAINER
    sudo docker exec -ti $MY_CONTAINER /bin/bash
fi
