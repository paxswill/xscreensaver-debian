#!/bin/sh

while read HACK PACKAGE COMMENT
do
    [ -z "$HACK" ] && continue
    [ $HACK != "${HACK#\#}" ] && continue
    dh_install -p$PACKAGE debian/tmp/usr/lib/xscreensaver/$HACK || exit 1
    dh_installman -p$PACKAGE debian/tmp/usr/share/man/man6/$HACK.6x
    dh_install -p$PACKAGE debian/tmp/usr/share/xscreensaver/config/$HACK.xml
    dh_install -p$PACKAGE debian/tmp/usr/share/applications/screensavers/$HACK.desktop
done < debian/split-hacks.config
exit 0
