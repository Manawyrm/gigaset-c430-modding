#!/bin/bash

# NOTE: This script should only be run on this exact version of the firmware!
# [gigaset-c430-modding]$ md5sum gigaset_c430hx.bin 
# a39056b930f36b4407b37ad627c2d323  gigaset_c430hx.bin
# 
# Other firmware versions will have different offsets for both the MIDI files
# and string literals for their names. Run midi_dump.php to find out where the
# MIDI files are located in your firmware binary, use a hex editor to find the 
# string names of the ringtones and then replace the values accordingly.

# [midi-export]$ ls -lA *.mid
# -rw-r--r-- 1 manawyrm users  123 21.11.2022 17:15 extract-1662195.mid
# -rw-r--r-- 1 manawyrm users   34 21.11.2022 17:15 extract-1662318.mid
# -rw-r--r-- 1 manawyrm users  110 21.11.2022 17:15 extract-1662352.mid
# -rw-r--r-- 1 manawyrm users   48 21.11.2022 17:15 extract-1662462.mid
# -rw-r--r-- 1 manawyrm users  403 21.11.2022 17:15 extract-1662510.mid
# -rw-r--r-- 1 manawyrm users   72 21.11.2022 17:15 extract-1662913.mid
# -rw-r--r-- 1 manawyrm users   78 21.11.2022 17:15 extract-1662985.mid
# -rw-r--r-- 1 manawyrm users  207 21.11.2022 17:15 extract-1663063.mid
# -rw-r--r-- 1 manawyrm users  125 21.11.2022 17:15 extract-1663270.mid
# -rw-r--r-- 1 manawyrm users  503 21.11.2022 17:15 extract-1663395.mid
# -rw-r--r-- 1 manawyrm users  155 21.11.2022 17:15 extract-1663898.mid
# -rw-r--r-- 1 manawyrm users  369 21.11.2022 17:15 extract-1664053.mid
# -rw-r--r-- 1 manawyrm users  535 21.11.2022 17:15 extract-1664422.mid
# -rw-r--r-- 1 manawyrm users   84 21.11.2022 17:15 extract-1664957.mid
# -rw-r--r-- 1 manawyrm users  252 21.11.2022 17:15 extract-1665041.mid
# -rw-r--r-- 1 manawyrm users  707 21.11.2022 17:15 extract-1665293.mid
# -rw-r--r-- 1 manawyrm users  137 21.11.2022 17:15 extract-1666000.mid
# -rw-r--r-- 1 manawyrm users  728 21.11.2022 17:15 extract-1666137.mid
# -rw-r--r-- 1 manawyrm users 1901 21.11.2022 17:15 extract-1666865.mid - Expect -  Cruel Angel Thesis
# -rw-r--r-- 1 manawyrm users 3413 21.11.2022 17:15 extract-1668766.mid - Fact - Hello OMFG
# -rw-r--r-- 1 manawyrm users 1449 21.11.2022 17:15 extract-1672179.mid
# -rw-r--r-- 1 manawyrm users 1990 21.11.2022 17:15 extract-1673628.mid - Good news - Still alive
# -rw-r--r-- 1 manawyrm users 4026 21.11.2022 17:15 extract-1675618.mid - Sugar - 1000 weisse Lilien
# -rw-r--r-- 1 manawyrm users 2223 21.11.2022 17:15 extract-1679644.mid
# -rw-r--r-- 1 manawyrm users 2831 21.11.2022 17:15 extract-1681867.mid - Fadin - Super 8
# -rw-r--r-- 1 manawyrm users 4701 21.11.2022 17:15 extract-1684698.mid - Fusion - 23
# -rw-r--r-- 1 manawyrm users 3792 21.11.2022 17:15 extract-1689399.mid - Trippin - Megaman
# -rw-r--r-- 1 manawyrm users 3773 21.11.2022 17:15 extract-1693191.mid - Smile - Nyan
# -rw-r--r-- 1 manawyrm users 3229 21.11.2022 17:15 extract-1696964.mid - Flow - Never Gonna
# -rw-r--r-- 1 manawyrm users 6474 21.11.2022 17:15 extract-1700193.mid - Tiger - C64
# -rw-r--r-- 1 manawyrm users  161 21.11.2022 17:15 extract-1706667.mid
# -rw-r--r-- 1 manawyrm users  119 21.11.2022 17:15 extract-1706828.mid

dd if=gigaset_c430hx.bin of=gigaset_c430hx_mod.bin bs=8k

# # replace extract-1700193.mid - "Tiger"
# dd if=midi/great-giana-sisters.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1700193
# echo -n "Giana" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E25))

# replace extract-1700193.mid - "Tiger"
dd if=midi/Commodore_C_64_subtune1.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1700193
echo -n "C64  " | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E25))

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

# replace extract-1666865.mid - "Expect"
dd if=midi/cruelangelthesis.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1666865
echo -n "Angel " | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0DDD))

# replace extract-1675618.mid - "Sugar"
dd if=midi/1000_weisse_Lilien_subtune1.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1675618
echo -n "1000w" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0DFA))

# replace extract-1681867.mid - "Fadin"
dd if=midi/Super_8_subtune1.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1681867
echo -n "Supe8" | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E05))

# replace extract-1684698.mid - "Fusion"
dd if=midi/23_subtune1.mid of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=1684698
echo -n "23    " | dd of=gigaset_c430hx_mod.bin bs=1 conv=notrunc seek=$((0x1A0E0B))
