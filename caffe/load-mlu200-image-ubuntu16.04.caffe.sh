#/bin/bash
set -e

#Images name
MY_IMAGES="mlu270_v1.5.0_ubuntu16.04.caffe"

num=`sudo docker images | grep -w "${MY_IMAGES}" | wc -l`
echo ${num}
echo ${MY_IMAGES}

if [ 0 -eq ${num} ];then
    echo "The image is not loaded and is loading......"
    #load image
    sudo docker load < mlu270_v1.5.0_ubuntu16.04.caffe_v1.0.tar.gz
else
    echo "The image is already loaded!"
fi

echo "The image information:"
sudo docker images
