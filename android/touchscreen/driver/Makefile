# Comment/uncomment the following line to disable/enable debugging
#DEBUG = y

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG),y)
  DEBFLAGS = -O -g # "-O" is needed to expand inlines
else
  DEBFLAGS = -O2
endif
ccflags-y  += $(DEBFLAGS)


ifneq ($(KERNELRELEASE),)
# call from kernel build system

obj-m	:= dummy_ts.o

else

#KERNELDIR ?= /lib/modules/$(shell uname -r)/build
KERNELDIR ?= /home/fdbai/workspace/linux-2.6.35.11
PWD       := $(shell pwd)

default:
	$(MAKE) V=0 -C $(KERNELDIR) SUBDIRS=$(PWD) modules

endif


clean:
	rm -rf *.o *.ko *~ core .depend *.mod.c .*.cmd .tmp_versions .*.o.d Module.symvers modules.order

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend


ifeq (.depend,$(wildcard .depend))
include .depend
endif
