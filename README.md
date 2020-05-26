# triflight for iNav 4.2 by jihlein

This is a special Branch for iNav that supports tri copters with a special servo that has a feedback wire (analog output of the potentiometer in the servo controller).

Build:
- 8" Tricopter LR from Dvid Windestal
- FC: KakuteF4V2

# Ressources
- triflight iNav 2.4  [2p4p0tf0p5 diff](https://github.com/jihlein/inav/commit/73d5e5295a4e89da7aa6ed960f17e512d7855570) [2p4p0tf0p5 new files](https://github.com/jihlein/inav/commit/ca994a8c20a5305f06020bf433f342b4c4ca543e)
- [Older Development Discussion on rcexplorer.se](https://rcexplorer.se/forums/topic/inav-for-kakutef4v2-based-tricopters/)
- [Continued Discussion on RCGroups,com](https://www.rcgroups.com/forums/showthread.php?3523531-Triflight-with-INAV)
- [Impossible tail-servo tilt mechanism](https://www.thingiverse.com/thing:1035497)
- Servos: [Turnigy 210 Servo](https://hobbyking.com/en_us/turnigytm-tgy-210dmh-coreless-w-heat-sink-ds-mg-servo-3-9kg-0-13sec-16g.html?___store=en_us) / BMS-210DMH

## TriFlight Configuration Options

| name | min | max | default | unit |
| --- | ---: |  ---: |  ---: | --- |
| tri_dynamic_yaw_minthrottle | 0 | 500 | 100 |  |
| tri_dynamic_yaw_maxthrottle | 0 | 100 | 100 |  |
| tri_dynamic_yaw_hoverthrottle | 0 | 2000 | 0 |  |
| tri_motor_acc_yaw_correction | 0 | 200 | 6 |  |
| tri_motor_acceleration | 1 | 100 | 18 |  |
| tri_servo_angle_at_max | 0 | 400 | 400 |  |
| tri_servo_feedback |  |  | TRI_SERVO_FB_RSSI |  |
| tri_servo_max_adc | 0 | 65535 | 0 |  |
| tri_servo_mid_adc | 0 | 65535 | 0 |  |
| tri_servo_min_adc | 0 | 65535 | 0 |  |
| tri_tail_motor_thrustfactor | 10 | 400 | 138 |  |
| tri_tail_servo_speed | 0 | 1000 | 300 | deg/s |

## Output Mappings 2p4p0tf0p5/KAKUTEF4V2TRI

| Actuator | Pad | Comment |
| --- | --- | --- |
| Motor 1 | M3 (M1) | (FL) pos: backwards |
| Motor 2 | M2 (M2) | (FR) pos: front right |
| Motor 3 | M1 (M3) | (B)  pos: front left |
| Tail Servo | LED | Only with branch 2p4p0tf0p5 |
| Feedback | RSI | Servo feedback wire |

## Compile Firmware on Linux

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
make TARGET=KAKUTEF4V2TRI ARM_SDK_DIR=tools/gcc-arm-none-eabi-8-2018-q4-major
#make TARGET=KAKUTEF4V2 ARM_SDK_DIR=tools/gcc-arm-none-eabi-8-2018-q4-major
```
