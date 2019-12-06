#-------------------------------------------------------
# Dockerfile for building a passive IMSI-CATCHER system
# Using: 
#---> a NooElec NESDR SMArt device: https://www.nooelec.com/store/sdr/sdr-receivers/nesdr-smart-xtr.html
#---> GNU-Radio: https://www.gnuradio.org/
#---> GR-GSM: https://github.com/ptrkrysik/gr-gsm
#---> and an IMSI-CATCHER script: https://github.com/Oros42/IMSI-catcher
#
#
#---> git clone the repo
#-->> build via 'docker build -t rtl-sdr .'
#->>> modify the docker-compose.yml to your needs
#>>>> run via 'docker-compose up
#
# last modified:
#     2019-12-06 - First Commit
#
#-------------------------------------------------------
FROM debian:stretch
MAINTAINER Bruno BORDAS "bruno.bordas@gmx.com"

###############################
# Install NooElec NESDR SMArt #
###############################

RUN mkdir /etc/modprobe.d/
RUN echo "blacklist dvb_usb_rtl28xxu" > /etc/modprobe.d/blacklist-dvb.conf # blacklist the regular DVB driver

#############################
# Install Required Packages #
#############################

RUN apt-get update && apt-get full-upgrade -y && apt-get install -y software-properties-common && add-apt-repository ppa:gnuradio/gnuradio-releases-3.7 && DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf build-essential cmake doxygen g++ gcc git gnuradio-dev gr-osmosdr gr-osmosdr libc6 libcppunit-dev liblog4cpp5-dev libosmocore-dev libtool make pkg-config python-docutils python-gtk2 python-numpy python-scapy python-scipy python-scipy rtl-sdr swig

##################
# Install GR-GSM #
##################

RUN mkdir $HOME/.grc_gnuradio/ $HOME/.gnuradio/ $HOME/tools
RUN cd $HOME/tools && git clone https://git.osmocom.org/gr-gsm && cd gr-gsm && mkdir build && cd build && cmake .. && make -j 2 && make install && ldconfig && make CTEST_OUTPUT_ON_FAILURE=1 test

########################
# Install IMSI-CATCHER #
########################

RUN cd $HOME/tools && git clone https://github.com/Oros42/IMSI-catcher.git

CMD ["/bin/bash"]
