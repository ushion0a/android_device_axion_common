TARGET_SHIPS_AXION_KERNEL_MODULES := true
TARGET_SUPPORTS_KERNEL_MANAGER := true
TARGET_DISABLES_LIBPERF := true

AXION_KERNEL_MANAGER_CONFIG ?= device/axion/common/prebuilts/ax_kernel_manager_$(AXION_SOC).xml
AXION_PERF_THERMAL_CONFIG ?= device/axion/common/prebuilts/ax_perf_thermal_$(AXION_SOC).xml

ifeq ($(TARGET_SUPPORTS_KERNEL_MANAGER),true)
PRODUCT_COPY_FILES += \
    $(AXION_KERNEL_MANAGER_CONFIG):$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/ax_kernel_manager.xml
endif

TARGET_PRODUCT_PROP += device/axion/common/platform/$(AXION_SOC)/props/ax_$(AXION_SOC).prop

PRODUCT_COPY_FILES += \
    device/axion/common/init/init.axion.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.axion-common.rc \
    device/axion/common/init/init.axion.modules.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.axion.modules.rc \
    device/axion/common/init/ax_init_$(AXION_SOC).rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/ax_init_$(AXION_SOC).rc \
    $(AXION_PERF_THERMAL_CONFIG):$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/ax_perf_thermal.xml
