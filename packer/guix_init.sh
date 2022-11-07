#!/bin/bash

set -e

wget https://ci.guix.gnu.org/search/latest/archive?query=spec:tarball+status:success+system:x86_64-linux+guix-binary.tar.xz -o x86_64-linux+guix-binary-latest.tar.xz
tar --warning=no-timestamp -xf x86_64-linux+guix-binary-latest.tar.xz
mv var/guix /var/ && mv gnu /
ln -sf /var/guix/profiles/per-user/root/guix-profile          ~root/.guix-profile
groupadd --system guixbuild
for i in `seq -w 1 10`;   do     useradd -g guixbuild -G guixbuild                       -d /var/empty -s `which nologin`                -c "Guix build user $i" --system                guixbuilder$i;   done
cp ~root/.guix-profile/lib/systemd/system/guix-daemon.service         /etc/systemd/system/
systemctl start guix-daemon
mkdir -p /usr/local/bin
ln -s /var/guix/profiles/per-user/root/guix-profile/bin/guix /usr/local/bin/guix
guix archive --authorize < ~root/.guix-profile/share/guix/hydra.gnu.org.pub

sfdisk /dev/xvdf <<END
label: gpt
label-id: 0xb991d10f
device: /dev/xvdf
unit: sectors

/dev/xvdf1 : start=        2048, size=    16775168, type=83, bootable
END

mkfs.bcachefs -L my-root /dev/xvdf1
mount /dev/xvdf1 /mnt

TARGET=/mnt
BACKING_DIR=/tmp/guix-inst
STORE_PREFIX=/gnu/store

tmpdir=$TARGET/tmp
mkdir -p tmpdir
mount --bind /tmp $tmpdir
rwdir=$TARGET/$BACKING_DIR
workdir=$rwdir/../.overlayfs-workdir

mkdir -p $rwdir
mkdir -p $workdir
mkdir -p /.rw-store

chown 30000 $rwdir
chmod 1775 $rwdir
chown 30000 /.rw-store
chmod 1775 /.rw-store

mount --make-private /

mount -t overlay overlay -o lowerdir=$STORE_PREFIX,upperdir=$rwdir,workdir=$workdir /.rw-store
mount --move /.rw-store $STORE_PREFIX
rmdir /.rw-store

hostname=host

guix system init /home/$USER/$HOSTconfig.scm /mnt
