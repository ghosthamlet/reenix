# This file is meant to change some aspect of how weenix is built or run.

# Variables in this file should meet the following criteria:
# * They change some behavior in the building or running of weenix that someone
#   using weenix for educational purposes could reasonably want to change on a regular
#   basis. Note that variables like CFLAGS are not defined here because they should
#   generally not be changed.

# Should we show the build commands as we run them?
HIDE ?= "true"

# What should we build for
TARGET ?= $(PROJECT_ROOT)/kernel/mk/i686-reenix.json

# What is the directory where a rust source tree is checked out.
RUST_SOURCE_DIR ?= $(PROJECT_ROOT)/external/rust

# Build compiler-rt from source. this might take a while.
BUILD_COMPILER_RT ?= "false"
#BUILD_COMPILER_RT ?= "true"

# Use this file as libcompiler-rt.a
COMPILER_RT_PATH ?= ""

# Should we run ld with --gc-sections flag. If true then we will remove unused
# sections, making the binary much smaller, we could lose some debug
# information.
LD_OPT ?= "true"

# Should we use stack check. true we will. Anything else we will not.
USE_STACK_CHECK ?= "true"

# The opt levels for crates.
DEFAULT_CRATE_OPT := 2

#
# Setting any of these variables will control which parts of the source tree
# are built. To enable something set it to 1, otherwise set it to 0.
#
     DRIVERS=1
         VFS=1
        S5FS=0
          VM=0
     DYNAMIC=0
# When you finish S5FS, first enable "VM"; once this is working, then enable
# "DYNAMIC".

#
# Set the number of terminals that we should be launching.
#
        NTERMS=3

#
# Set the number of disks that we should be launching
#
        NDISKS=1

# Switches for non-required components. If you wish to try implementing
# some extra features in Weenix, there are some pre-designed features
# you can add. Turn on one of these flags and re-compile Weenix. Please
# see the Wiki for details on what is provided by changing these flags
# and what you will need to implement to complete them, of course you
# are always free to implement your own features as well. Remember, though
# these features are not "extra-credit" they are purely for academic
# interest. The most important thing is that you have a working core
# implementation, and that is what you will be graded on. If you decide
# to implement extra features please make sure your core Weenix is working
# first, and make sure to make a copy of your working Weenix before you
# go breaking it, which we promise you will happen.

        MOUNTING=0 # be able to mount multiple file systems
          GETCWD=0 # getcwd(3) syscall-like functionality
        UPREEMPT=0 # userland preemption
             MTP=0 # multiple kernel threads per process
           PIPES=0 # pipe(2) functionality
         SHADOWD=0 # shadow page cleanup
          COLORS=1 # Should debug messages have colors

# These are some options that can be used for stress testing stuff
       SMALL_PID=0 # Make a process id be a u8, so it will overflow and run out quickly.
 TEST_LOW_MEMORY=0 # Only use the backup allocator. It will give it a much bigger chunk.

# A list of any other cfgs one wants to pass in.
 ADDITIONAL_CFGS=

# These are some options that were in-file #defines in the C version. We are making them cfg's now.
 SLAB_CHECK_FREE=1 # Do we have slab checking on.
# Boolean options specified in this specified in this file that should be
# included as definitions at compile time
        COMPILE_CONFIG_BOOLS=DRIVERS \
							 VFS \
							 S5FS \
							 VM \
							 FI \
							 DYNAMIC \
							 MOUNTING \
							 MTP \
							 SHADOWD \
							 GETCWD \
							 UPREEMPT \
							 PIPES \
							 SLAB_CHECK_FREE \
							 REAL_SPIN_ONCE \
							 TEST_LOW_MEMORY \
							 COLORS \
							 SMALL_PID

# As above, but not booleans
        COMPILE_CONFIG_DEFS=" NTERMS NDISKS DBG DISK_SIZE BOCHS_INSTALL_DIR "

# Parameters for the hard disk we build (must be compatible!)
# If the FS is too big for the disk, BAD things happen!
        DISK_BLOCKS=2048 # For fsmaker
        DISK_INODES=240 # for fsmaker

# Debug message behavior. Note that this can be changed at runtime by
# modifying the dbg_modes global variable.
# All debug statements
        REMOVE_DBG ?= MM PAGEALLOC SCHED
        DBG ?= all,-mm,-pagealloc,-sched
# Change to this for no debug statements
#       DBG =-all

# terminal binary to use when opening a second terminal for gdb
        GDB_TERM=xterm
        GDB_PORT=1234

# The amount of physical memory which will be available to Weenix (in megabytes)
# XXX MEMORY=32 is hardcoded in ./weenix right now -- this line here is
#     currently ignored
        MEMORY=256

# The rust lints to use
 ALLOW_LINTS =
  WARN_LINTS =
  DENY_LINTS =
FORBID_LINTS =
