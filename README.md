#

## compile

### clone and check out branch

``` 
git clone git@github.com:jihlein/inav.git
cd inav
git checkout 2p4p0tf0p5
``` 

### Prerequesites according to "Buidling in Ubuntu.md"

``` 
sudo apt install gcc-arm-none-eabi
arm-none-eabi-gcc -dumpversion
7.3.1
``` 

### update compiler (inav 2.4 on debian)

``` 
make arm_sdk_install
``` 

### Build KAKUTEF4V2

build with recent compiler, override compiler directory in tools.mk

``` 
make TARGET=KAKUTEF4V2 ARM_SDK_DIR=tools/gcc-arm-none-eabi-8-2018-q4-major
```
