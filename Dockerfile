FROM ubuntu:latest
MAINTAINER xuntian "li.zq@foxmail.com"

RUN apt-get -y update && apt-get -y install git wget build-essential cmake libcurl4-openssl-dev \
        libssl-dev libssh2-1-dev libbz2-dev freeglut3 freeglut3-dev libglew1.5 libglew1.5-dev \
        libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD ./ /opt/NPLRuntime 

WORKDIR /opt/NPLRuntime

RUN git submodule init && git submodule update

RUN chmod +x npl_install.sh; sync; ./npl_install.sh && rm -rf /opt/NPLRuntime/bin && rm -rf /usr/local/include/boost

#RUN cd /opt && git clone https://github.com/LiXizhi/NPLRuntime.git && \
#        cd /opt/NPLRuntime && git submodule init && git submodule update && \
#        chmod +x npl_install.sh; sync; ./npl_install.sh && rm -rf /opt/NPLRuntime/bin && rm -rf /usr/local/include/boost
