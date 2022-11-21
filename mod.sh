#!/bin/bash

# NOTE: This script should only be run on this exact version of the firmware!
# [gigaset-c430-modding]$ md5sum gigaset_c430hx.bin 
# a39056b930f36b4407b37ad627c2d323  gigaset_c430hx.bin
# 
# Other firmware versions will have different offsets for both the MIDI files
# and string literals for their names. Run midi_dump.php to find out where the
# MIDI files are located in your firmware binary, use a hex editor to find the 
# string names of the ringtones and then replace the values accordingly.

dd if=gigaset_c430hx.bin of=gigaset_c430hx_mod.bin bs=8k

# replace extract-1700193.mid - "Tiger"
dd if=midi/great-giana-sisters.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1700193
echo -n "Giana" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E25))

# replace extract-1696964.mid - "Flow"
dd if=midi/nevergonna.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1696964
echo -n "Rick" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E20))

# replace extract-1693191.mid - "Smile"
dd if=midi/nyan.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1693191
echo -n "Nyan " | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E1A))

# replace extract-1689399.mid - "Trippin"
dd if=midi/megaman4.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1689399
echo -n "MegaMan" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E12))

# replace extract-1673628.mid - "Good news"
dd if=midi/stillalive.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1673628
echo -n "StilAlive" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0DF0))

# replace extract-1668766.mid - "Fact"
dd if=midi/hello.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1668766
echo -n "OMFG" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0DE4))