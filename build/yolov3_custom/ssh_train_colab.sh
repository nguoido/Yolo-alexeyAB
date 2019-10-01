sudo apt-get install vim  
git clone -b colab https://dovankhai:khai9721@github.com/dovankhai/my_alexeyAB.git
cd /content/drive/"My Drive"/OKOK/my_alexeyAB/build/yolov3_custom
python splitTrainAndTest.py /content/drive/"My Drive"/OKOK/my_alexeyAB/build/yolov3_custom/images
# sed -i 's/My Drive/"My Drive"/g' train.txt
# sed -i 's/My Drive/"My Drive"/g' test.txt
cd /content/drive/"My Drive"/OKOK/my_alexeyAB

# Xac dinh trong tai khoan nao
echo "export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}$" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
make
#./darknet partial build/yolov3_custom/yolov3-tiny_xnor_person.cfg build/yolov3_custom/yolov3-tiny_xnor_person_2000.weights yolov3-tiny.conv.15 15
wget https://pjreddie.com/media/files/yolov3-tiny.weights
./darknet partial build/yolov3_custom/yolov3-tiny_xnor_person.cfg yolov3-tiny.weights yolov3-tiny.conv.15 15
./darknet detector train build/yolov3_custom/darknet.data build/yolov3_custom/yolov3-tiny_xnor_person.cfg yolov3-tiny.conv.15 -dont_show

export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so
nvidia-smi
