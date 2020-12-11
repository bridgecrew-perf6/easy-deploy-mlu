#!/bin/bash
#!/bin/bash
# Download latest models from https://github.com/ultralytics/yolov3/releases
# Usage:
#    $ bash download_weights.sh

#下载yolov3.weights
wget https://pjreddie.com/media/files/yolov3.weights
#回显确认
ls -la