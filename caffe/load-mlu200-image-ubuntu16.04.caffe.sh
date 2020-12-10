#/bin/bash
set -e

#Images name
FILENAME_IMAGES="mlu270_v1.5.0_ubuntu16.04.caffe_v1.0.tar.gz"
FULLNAME_IMAGES="./${FILENAME_IMAGES}"

# Color variable
none="\033[0m"
green="\033[0;32m"
red="\033[0;31m"
yellow="\033[1;33m"

if [[ $# -eq 0 ]];then
    echo -e "${yellow}WARNING: Load images(${FULLNAME_IMAGES}) by default. ${none}"
else
    FULLNAME_IMAGES="${1}"
fi
#Check
if [[ ! -f ${FULLNAME_IMAGES} ]]; then
    echo -e "${red}ERROR: Images(${FULLNAME_IMAGES}) does not exist! ${none}" &&  exit -1
fi
if [[ ! ${FULLNAME_IMAGES} =~ ${FILENAME_IMAGES} ]]; then
    echo -e "${red}ERROR: Images(${FULLNAME_IMAGES}), please use images(fileName:${FILENAME_IMAGES})! ${none}" &&  exit -1
fi

#Images name
MY_IMAGES="mlu270_v1.5.0_ubuntu16.04.caffe"

num=`sudo docker images | grep -w "${MY_IMAGES}" | wc -l`
echo ${num}
echo ${MY_IMAGES}

if [ 0 -eq ${num} ];then
    echo "The image is not loaded and is loading......"
    #load image
    sudo docker load < ${FULLNAME_IMAGES}
else
    echo "The image is already loaded!"
fi

echo "The image information:"
sudo docker images
