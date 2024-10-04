LINUXTV_MENU := V4L-DVB Drivers

define MediaTuner
  SUBMENU := $(LINUXTV_MENU)
  KCONFIG := $(2)
  DEPENDS := +kmod-mc +kmod-i2c-core $(3)
  FILES := $(LINUX_DIR)/drivers/media/tuners/$(1).ko
  AUTOLOAD := $(call AutoProbe,$(1))
endef

# -- Astrameta
define KernelPackage/media-tuner-r820t
  TITLE := Rafael Micro R820T
  $(call MediaTuner,r820t,CONFIG_MEDIA_TUNER_R820T)
endef
$(eval $(call KernelPackage,media-tuner-r820t))

# -- MyGica
define KernelPackage/media-tuner-si2157
  TITLE := Silicon Labs Si2157
#  $(call MediaTuner,+kmod-mc,si2157,CONFIG_MEDIA_TUNER_SI2157)
  $(call MediaTuner,si2157,CONFIG_MEDIA_TUNER_SI2157)
endef
$(eval $(call KernelPackage,media-tuner-si2157))

