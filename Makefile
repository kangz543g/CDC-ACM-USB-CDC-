EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_MINIMAL_MEMORY_USAGE
ARCH ?= mips
CROSS_COMPILE ?= /home/kkk/mips-gcc472-glibc216-64bit/bin/mips-linux-gnu-
KSRC ?= /home/kkk/Main/kernel

#EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS) 
#EXTRA_CFLAGS += -O1
#EXTRA_CFLAGS += -O3
#EXTRA_CFLAGS += -Wno-unused-variable
#EXTRA_CFLAGS += -Wno-unused-value
#EXTRA_CFLAGS += -Wno-unused-label
#EXTRA_CFLAGS += -Wno-unused-parameter
#EXTRA_CFLAGS += -Wno-unused-function
#EXTRA_CFLAGS += -Wno-unused
#EXTRA_CFLAGS += -Wno-address
#EXTRA_CFLAGS += -Wno-cast-function-type
#EXTRA_CFLAGS += -Wno-discarded-qualifiers
#EXTRA_CFLAGS += -Wno-uninitialized
#EXTRA_CFLAGS += -Wno-sometimes-uninitialized
#EXTRA_CFLAGS += -Wno-enum-conversion
#EXTRA_CFLAGS += -Wno-vla
#EXTRA_CFLAGS += -Wno-date-time


obj-m := cdcacm.o
#obj-$(CONFIG_USB_ACM)		+= cdc-acm.o
#obj-$(CONFIG_USB_PRINTER)	+= usblp.o
#obj-$(CONFIG_USB_WDM)		+= cdc-wdm.o
#obj-$(CONFIG_USB_TMC)		+= usbtmc.o


all: modules

modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules

.PHONY: modules clean

clean:
	$(MAKE) -C $(KSRC) M=$(shell pwd) clean

