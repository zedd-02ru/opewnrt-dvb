LINUXTV_MENU := V4L-DVB Drivers

define KernelPackage/mc
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Media Controller API
  URL := https://linuxtv.org
  KCONFIG := \
  CONFIG_MEDIA_SUPPORT \
  CONFIG_MEDIA_SUPPORT_FILTER=y \
  CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y \
  CONFIG_MEDIA_USB_SUPPORT=y \
  CONFIG_MEDIA_CONTROLLER_DVB=n
#  CONFIG_MEDIA_CONTROLLER_REQUEST_API=n
  FILES := $(LINUX_DIR)/drivers/media/mc/mc.ko
  DEFAULT := y
  HIDDEN := y
  DEPENDS := @USB_SUPPORT
endef

define KernelPackage/mc/description
 Enable the media controller API used to query media devices internal
 topology and configure it dynamically.
endef
$(eval $(call KernelPackage,mc))

define KernelPackage/dvb-core
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DVB core support
  KCONFIG := \
  CONFIG_DVB_CORE \
  CONFIG_DVB_NET=n \
  CONFIG_DVB_MAX_ADAPTERS=16 \
  CONFIG_DVB_DYNAMIC_MINORS=n \
  CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=n \
  CONFIG_DVB_ULE_DEBUG=n \
  CONFIG_DVB_PLATFORM_DRIVERS=n  
  FILES := $(LINUX_DIR)/drivers/media/dvb-core/dvb-core.ko
  AUTOLOAD := $(call AutoProbe,dvb-core)
  DEPENDS += +kmod-mc
#  DEPENDS := +kmod-mc
endef

define KernelPackage/dvb-core/description
 Kernel modules for DVB support.
endef
$(eval $(call KernelPackage,dvb-core))

