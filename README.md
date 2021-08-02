# notice
DidOS is currently only designed for uefi systems with a btrfs root and partition labels. feel free to request more unusual configurations obviously. some efforts have been made to add some flexibility via the var folder. It is recommended that you keep a backup OS. some software will be badly installed during the installation process, if you can find some kind of binary that would be cool, i just copied files; it is symlinked so installation should replace the files easily
# extra tools
## chroot.sh
use this to restore the chroot. in other words, how you access the OS without booting into it. the command is like so:
cd /run/media/seirra/funtoo/didos-install/bin/ && ./chroot.sh
where you cd into the current mounted didos-install/bin/ location
# instructions
0. run this to establish a resource folder and get in the correct folder: cd ~ && git clone https://github.com/prototype99/didos-install.git && cd ~/didos-install/bin
1. create a fat32 boot partition with the esp flag. recommended size is around 200mb. if such a partition already exists it is recommended to use it.
2. create a swap partition roughly equal to your ram
3. create a btrfs root partition
4. make sure all partitions have labels if you want them to, the assumption is made that you do
5. make sure that in the var direcctory dev is your device prefix, boot is your boot partition number and root is your root partition number
6. find a suitable stage 3 (set of base files) at https://www.funtoo.org/Subarches and save the download url to the url file in the aforementioned folder
7. make sure the fstab file is correct for your system
8. make sure time matches the desired file in /usr/share/zoneinfo
9. run ./init.sh
10. make sure the bottom of /var/db/repos/prototype99/profiles-local/layman.cfg has your git user details correct unless you want to give me free commit history should you make changes to any overlays you installed (how generous!)
11. run cd /didos-install/bin && ./inst.sh
12. run emerge dev-vcs/mercurial
13. run useradd -m seirra where seirra is the username, in later entries the assumption is made that you used that username so replace as necessary
14. run passwd to set a root password
15. run usermod -G wheel,audio seirra to add the user to all necessary groups
16. run passwd seirra to set a user password
17. run su - seirra