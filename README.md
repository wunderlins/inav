# triflight for iNav 4.2 by jihlein

This is a special Branch for iNav that supports tri copters with a special servo that has a feedback wire (analog output of the potentiometer in the servo controller).

Build:
- 8" Tricopter LR from Dvid Windestal
- FC: KakuteF4V2

# Ressources
- [known good configuration](https://www.rcgroups.com/forums/showpost.php?p=44425535&postcount=319) for iNav 2.4 triflight (2p4p0tf0p5)
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

| Actuator | Pad | Comment | Direction |
| --- | --- | --- | --- |
| Motor 1 | M3 (M1) | (FL) pos: backwards | CCW |
| Motor 2 | M2 (M2) | (FR) pos: front right | CW |
| Motor 3 | M1 (M3) | (B)  pos: front left | CCW |
| Tail Servo | LED | Only with branch 2p4p0tf0p5 | Reversed |
| Feedback | RSI | Servo feedback wire | n/a |

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

## iNav 2.4 Triflight configuration for Tricopter LR

```
diff

# version
# INAV/KAKUTEF4V2TRI 2.4.0 May 26 2020 / 18:28:11 (10da960b2)
# GCC-8.2.1 20181213 (release) [gcc-8-branch revision 267074]

# start the command batch
batch start

# resources

# mixer
mmix 0  1.000  0.000  1.333  0.000
mmix 1  1.000 -1.000 -0.667  0.000
mmix 2  1.000  1.000 -0.667  0.000

# servo mix
smix 0 5 2 100 0 -1

# servo
servo 5 1000 2000 1500 -100

# logic

# gf

# feature
feature VBAT
feature DYNAMIC_FILTERS
feature TRIFLIGHT
feature PWM_OUTPUT_ENABLE

# beeper

# map

# serial
serial 0 0 115200 115200 0 115200
serial 5 4096 115200 115200 0 115200

# led

# color

# mode_color

# aux
aux 0 0 2 900 1300
aux 1 1 0 900 1300
aux 2 11 2 1300 1700
aux 3 42 1 900 1300

# adjrange

# rxrange

# temp_sensor

# wp
#wp 0 invalid

# osd_layout

# master
set looptime = 500
set gyro_hardware_lpf = 256HZ
set gyro_lpf_hz = 110
set gyro_lpf_type = PT1
set acc_hardware = MPU6500
set acczero_x = 23
set acczero_y = -17
set accgain_x = 4089
set accgain_y = 4093
set accgain_z = 4043
set mag_hardware = NONE
set baro_hardware = BMP280
set pitot_hardware = NONE
set rssi_channel = 12
set serialrx_provider = CRSF
set motor_pwm_rate = 8000
set motor_pwm_protocol = DSHOT300
set platform_type = TRICOPTER
set model_preview_type = 1
set servo_pwm_rate = 330
set applied_defaults = 2
set mc_airmode_type = THROTTLE_THRESHOLD
set i2c_speed = 800KHZ
set name = Tricopter LR
set vtx_band = 5
set vtx_channel = 8
set vtx_freq = 5917

# profile
profile 1

set mc_p_pitch = 45
set mc_i_pitch = 50
set mc_d_pitch = 39
set mc_i_roll = 60
set mc_d_roll = 34
set mc_p_yaw = 180
set mc_i_yaw = 60
set mc_d_yaw = 3
set max_angle_inclination_rll = 600
set max_angle_inclination_pit = 600
set dterm_lpf_hz = 60
set dterm_lpf_type = PT1
set dterm_lpf2_hz = 170
set dterm_lpf2_type = PT1
set use_dterm_fir_filter = OFF
set yaw_lpf_hz = 30
set dterm_setpoint_weight =  0.750
set dterm_notch_hz = 162
set dterm_notch_cutoff = 120
set heading_hold_rate_limit = 45
set nav_mc_vel_xy_i = 14
set nav_mc_heading_p = 65
set d_boost_factor =  1.500
set antigravity_gain =  2.000
set antigravity_accelerator =  5.000
set tpa_rate = 20
set tpa_breakpoint = 1650
set rc_yaw_expo = 70
set roll_rate = 30
set pitch_rate = 30
set yaw_rate = 30

# battery_profile
battery_profile 1

set battery_capacity = 5000
set battery_capacity_warning = 2000
set battery_capacity_critical = 1500

# end the command batch
batch end

# 
```
