# rtl-sdr
Docker image for building a passive IMSI-CATCHER system using a NooElec NESDR SMArt device, the GNU-Radio software, the GR-GSM software, and an IMSI-CATCHER script

# Dockerfile for building a passive IMSI-CATCHER system
# Using: 
---> a NooElec NESDR SMArt device: https://www.nooelec.com/store/sdr/sdr-receivers/nesdr-smart-xtr.html
---> GNU-Radio: https://www.gnuradio.org/
---> GR-GSM: https://github.com/ptrkrysik/gr-gsm
---> and an IMSI-CATCHER script: https://github.com/Oros42/IMSI-catcher


# Usage:
--> git clone the repo
->> build via 'docker build -t rtl-sdr .'
>>> run via 'docker run -ti --device /dev/swradio0 rtl-sdr /bin/bash'
where $swradio0 is the device

Enjoy
