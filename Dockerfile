FROM ermaker/keras-jupyter:gpu


RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nvidia-361-dev

RUN path=$(find /usr/ -name 'libcuda.so.1' | head -1) && cp "$path" /usr/local/cuda/lib64

VOLUME /notebook
WORKDIR /notebook
EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --NotebookApp.allow_origin='*'
