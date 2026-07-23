export THEOS=~/theos
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = Standoff2

include $(THEOS)/makefiles/common.mk
TWEAK_NAME = Standoff2Cheat
Standoff2Cheat_FILES = Tweak.xm
include $(THEOS_MAKE_PATH)/tweak.mk
