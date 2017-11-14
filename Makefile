#
# Makefile for the linux ext2-filesystem routines.
#

#obj-$(CONFIG_EXT2_FS) += ext2.o

#ext2-y := balloc.o dir.o file.o ialloc.o inode.o \
#	  ioctl.o namei.o super.o symlink.o

#ext2-$(CONFIG_EXT2_FS_XATTR)	 += xattr.o xattr_user.o xattr_trusted.o
#ext2-$(CONFIG_EXT2_FS_POSIX_ACL) += acl.o
#ext2-$(CONFIG_EXT2_FS_SECURITY)	 += xattr_security.o

ifneq ($(KERNELRELEASE),)
obj-m := pengExt2.o
pengExt2-objs := balloc.o dir.o file.o ialloc.o inode.o \
	  ioctl.o namei.o super.o symlink.o
CFLAGS_balloc.o := -DDEBUG
CFLAGS_dir.o := -DDEBUG
CFLAGS_file.o := -DDEBUG
CFLAGS_ialloc.o := -DDEBUG	
CFLAGS_inode.o := -DDEBUG
CFLAGS_ioctl.o := -DDEBUG	
CFLAGS_namei.o := -DDEBUG
CFLAGS_super.o := -DDEBUG
CFLAGS_symlink.o := -DDEBUG

else
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
endif
