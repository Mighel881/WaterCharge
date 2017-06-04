TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
ARCHS = armv7 arm64
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

BUNDLE_NAME = WaterWave
WaterWave_FILES = WaterWave.mm
WaterWave_INSTALL_PATH = /Library/PreferenceBundles
WaterWave_FRAMEWORKS = UIKit MessageUI CoreGraphics
WaterWave_PRIVATE_FRAMEWORKS = Preferences AppSupport
WaterWave_LIBRARIES += cepheiprefs MobileGestalt
CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WaterWave.plist$(ECHO_END)
