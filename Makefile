ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = WaterWave
WaterWave_FILES = Tweak.xm
WaterWave_FILES += BAFluidView.m
WaterWave_FILES += UIColor+ColorWithHex.m
WaterWave_FRAMEWORKS = UIKit CoreGraphics QuartzCore CoreMotion AudioToolbox AVFoundation
WaterWave_LIBRARIES += cephei
WaterWave_CFLAGS = -Wno-error
WaterWave += -Wl,-segalign,4000
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += waterwave
include $(THEOS_MAKE_PATH)/aggregate.mk
