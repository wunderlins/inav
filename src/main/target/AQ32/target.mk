F405_TARGETS   += $(TARGET)
FEATURES       += VCP SDCARD

TARGET_SRC = \
            drivers/accgyro/accgyro_mpu6000.c \
            drivers/barometer/barometer_ms56xx.c \
            drivers/compass/compass_hmc5883l.c \
            drivers/light_ws2811strip.c
