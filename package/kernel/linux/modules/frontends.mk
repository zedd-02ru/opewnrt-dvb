LINUXTV_MENU := V4L-DVB Drivers

define DvbFE
  SUBMENU := $(LINUXTV_MENU)
  KCONFIG := $(2)
  FILES := $(LINUX_DIR)/drivers/media/dvb-frontends/$(1).ko
  AUTOLOAD := $(call AutoProbe,$(1))
  DEPENDS := +kmod-i2c-core $(3)
# +kmod-i2c-mux
endef

# -- Astrometa
define KernelPackage/dvb-fe-rtl2832
  TITLE := Realtek RTL2832
  $(call DvbFE,rtl2832,CONFIG_DVB_RTL2832,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-rtl2832))


define KernelPackage/dvb-fe-mn88473
  TITLE := Panasonic MN88473
  $(call DvbFE,mn88473,CONFIG_DVB_MN88473,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-mn88473))

# -- MyGica
define KernelPackage/dvb-fe-si2168
  TITLE := Silicon Labs Si2168
#  $(call DvbFE,si2168,CONFIG_DVB_SI2168,+kmod-i2c-mux)
  $(call DvbFE,si2168,CONFIG_DVB_SI2168,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-si2168))


