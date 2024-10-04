# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := dvb-firmware
PKG_RELEASE := 5

PKG_SOURCE_DATE := 2021-07-19
PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/LibreELEC/dvb-firmware.git
PKG_SOURCE_VERSION := 0eaf5b3928561d06d254cf5489d1e622bc827e5d
PKG_MIRROR_HASH := c847ddf3ca0d8e81fbde7324c1c55d331077e2f708d79e3b4bfe914a4c90ac5a

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION := firmware
  CATEGORY := Firmware
  TITLE := $(1)
endef

Build/Compile := :


Package/si2158-firmware = $(call Package/firmware-default,Silicon Labs Si2158)
define Package/si2158-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-tuner-si2158-a20-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,si2158-firmware))


Package/si2168-firmware = $(call Package/firmware-default,Silicon Labs Si2168)
define Package/si2168-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-b40-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,si2168-firmware))

#--zedd
Package/mn88473-firmware = $(call Package/firmware-default,Realtek Labs mn88473)
define Package/mn88473-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-mn88473-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,mn88473-firmware))
#--zedd


#$(eval $(call BuildPackage,dvb-firmware))
