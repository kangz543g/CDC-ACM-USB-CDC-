EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_MINIMAL_MEMORY_USAGE
ARCH ?= mips
CROSS_COMPILE ?= /home/kkk/mips-gcc472-glibc216-64bit/bin/mips-linux-gnu-
KSRC ?= /home/kkk/Main/kernel

CONFIG_USB_ACM = m

obj-$(CONFIG_USB_ACM)		+= cdc-acm.o   
obj-$(CONFIG_USB_PRINTER)	+= usblp.o        
obj-$(CONFIG_USB_WDM)		+= cdc-wdm.o  
obj-$(CONFIG_USB_TMC)		+= usbtmc.o

all: modules

modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules

.PHONY: modules clean

clean:
	$(MAKE) -C $(KSRC) M=$(shell pwd) clean

