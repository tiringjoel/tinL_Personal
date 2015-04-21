cmd_/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o := /home/buchmann/fhnw/edu/tinL/17-build/tc/bin/arm-fhnw-linux-gnueabi-gcc -Wp,-MD,/home/buchmann/fhnw/edu/tinL/17-build/modules/.simple-module.o.d  -nostdinc -isystem /home/buchmann/fhnw/edu/tinL/17-build/tc/lib/gcc/arm-fhnw-linux-gnueabi/4.9.2/include -I/home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include -Iarch/arm/include/generated  -I/home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include -Iinclude -I/home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi -Iinclude/generated/uapi -include /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kconfig.h   -I/home/buchmann/fhnw/edu/tinL/17-build/modules -D__KERNEL__ -mlittle-endian   -I/home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/mach-bcm2708/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -fno-dwarf2-cfi-asm -fstack-protector -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=6 -march=armv6 -mtune=arm1136j-s -msoft-float -Uarm -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(simple_module)"  -D"KBUILD_MODNAME=KBUILD_STR(simple_module)" -c -o /home/buchmann/fhnw/edu/tinL/17-build/modules/.tmp_simple-module.o /home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.c

source_/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o := /home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.c

deps_/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o := \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/int-ll64.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitsperlong.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/posix_types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/stddef.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/stddef.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/posix_types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/posix_types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/const.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/stat.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/stat.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/stat.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
  /home/buchmann/fhnw/edu/tinL/17-build/tc/lib/gcc/arm-fhnw-linux-gnueabi/4.9.2/include/stdarg.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/linkage.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/stringify.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/linkage.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/bitops.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/bitops.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/typecheck.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/hwcap.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/non-atomic.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/fls64.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/sched.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/hweight.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/arch_hweight.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/const_hweight.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/lock.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/le.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/byteorder.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/byteorder/little_endian.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/swab.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/swab.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/swab.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/uapi/asm/swab.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/byteorder/generic.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/printk.h \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kern_levels.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/dynamic_debug.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/string.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/string.h \
    $(wildcard include/config/mach/bcm2708.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/errno.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/errno.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/errno-base.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/kernel.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/sysinfo.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/div64.h \
    $(wildcard include/config/aeabi.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/compiler.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/seqlock.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/bug.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/bottom_half.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/spinlock_types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/spinlock_types_up.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rwlock_types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/spinlock_up.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/hw_breakpoint.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rwlock.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/spinlock_api_up.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/atomic.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/cmpxchg-local.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/atomic-long.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/atomic64.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/math64.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/time.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/uidgid.h \
    $(wildcard include/config/uidgid/strict/type/checks.h) \
    $(wildcard include/config/user/ns.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/highuid.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kmod.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/gfp.h \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/cma.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/current.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/wait.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/bitmap.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/page-flags-layout.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  include/generated/bounds.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/glue.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/pgtable-2level-types.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/sizes.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/mach-bcm2708/include/mach/memory.h \
    $(wildcard include/config/bcm2708/nol2cache.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/memory_model.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/getorder.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/notifier.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rwsem-spinlock.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/srcu.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/completion.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rcutree.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/jiffies.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/timex.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/timex.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/param.h \
  arch/arm/include/generated/asm/param.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/asm-generic/param.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/timex.h \
    $(wildcard include/config/arch/multiplatform.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/mach-bcm2708/include/mach/timex.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/pfn.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/percpu.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/percpu.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/topology.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/rbtree.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/sysctl.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/elf.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/elf.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/user.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/elf.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/elf-em.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kobject.h \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/sysfs.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kobject_ns.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/kref.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/tracepoint.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/static_key.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/jump_label.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/system.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/switch_to.h \
    $(wildcard include/config/cpu/v7.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/system_info.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/system_misc.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/linux/reboot.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/uapi/linux/reboot.h \
  arch/arm/include/generated/asm/emergency-restart.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/emergency-restart.h \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
  /home/buchmann/fhnw/edu/tinL/resources/kernel/linux/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \

/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o: $(deps_/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o)

$(deps_/home/buchmann/fhnw/edu/tinL/17-build/modules/simple-module.o):
