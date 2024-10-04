LINUXTV_MENU := V4L-DVB Drivers


define KernelPackage/dvb-usb-v2
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Support for various USB DVB devices v2
  KCONFIG := \
  CONFIG_DVB_USB=n \
  CONFIG_DVB_USB_V2=y \
  CONFIG_DVB_USB_AF9015=n    \
  CONFIG_DVB_USB_AF9035=n    \
  CONFIG_DVB_USB_ANYSEE=n    \
  CONFIG_DVB_USB_AU6610=n    \
  CONFIG_DVB_USB_AZ6007=n    \
  CONFIG_DVB_USB_CE6230=n    \
  CONFIG_DVB_USB_EC168=n     \
  CONFIG_DVB_USB_GL861=n     \
  CONFIG_DVB_USB_LME2510=n   \
  CONFIG_DVB_USB_MXL111SF=n  \
  CONFIG_DVB_USB_DVBSKY=m    \
  CONFIG_DVB_USB_ZD1301=n    \
  CONFIG_DVB_TTUSB_BUDGET=n     \
  CONFIG_DVB_B2C2_FLEXCOP_USB=n \
  CONFIG_SMS_USB_DRV=n

  FILES := $(LINUX_DIR)/drivers/media/usb/dvb-usb-v2/dvb_usb_v2.ko
  AUTOLOAD := $(call AutoProbe,dvb_usb_v2)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-usb-core
endef

define KernelPackage/dvb-usb-v2/description
 By enabling this you will be able to choose the various supported
 USB1.1 and USB2.0 DVB devices.
endef
$(eval $(call KernelPackage,dvb-usb-v2))


define DvbUsbV2
  SUBMENU := $(LINUXTV_MENU)
  DEPENDS := +kmod-dvb-usb-v2 $(1)
endef


define KernelPackage/dvb-usb-rtl28xxu
  TITLE := Realtek RTL28xxU DVB USB support
  KCONFIG := CONFIG_DVB_USB_RTL28XXU
  FILES := $(LINUX_DIR)/drivers/media/usb/dvb-usb-v2/dvb-usb-rtl28xxu.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-rtl28xxu)
  $(call DvbUsbV2,+kmod-media-tuner-r820t +kmod-dvb-fe-rtl2832 +kmod-dvb-fe-mn88473 +mn88473-firmware)  
endef

define KernelPackage/dvb-usb-rtl28xxu/description
 Realtek RTL28xxU DVB USB support.
endef
$(eval $(call KernelPackage,dvb-usb-rtl28xxu))


define KernelPackage/dvb-usb-dvbsky
  TITLE := DVBSky USB support
  KCONFIG := CONFIG_DVB_USB_DVBSKY
  FILES := $(LINUX_DIR)/drivers/media/usb/dvb-usb-v2/dvb-usb-dvbsky.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dvbsky)
  $(call DvbUsbV2,+kmod-media-tuner-si2157 +kmod-dvb-fe-si2168 +si2158-firmware +si2168-firmware)
endef

define KernelPackage/dvb-usb-dvbsky/description
 Say Y here to support the USB receivers from DVBSky.
endef
$(eval $(call KernelPackage,dvb-usb-dvbsky))

