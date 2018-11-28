# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=SkyArk kernel for Xiaomi Redmi Note 4(X)
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=mido
'; } # end properties

# shell variables
block=/dev/block/platform/soc/7824900.sdhci/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
# don't even think about flashing on non-Treble
is_treble=$(file_getprop /system/build.prop "ro.treble.enabled");
if [ ! "$is_treble" -o "$is_treble" == "false" ]; then
  ui_print " ";
  ui_print "SkyArk is only compatible with Treble roms";
  exit 1;
fi;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
insert_line init.rc 'SkyArk' after 'import /init.\${ro.zygote}.rc' 'import /init.SkyArk.rc';

# end ramdisk changes

write_boot;

## end install