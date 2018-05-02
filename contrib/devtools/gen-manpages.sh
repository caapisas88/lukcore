#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

LUKD=${LUKD:-$SRCDIR/lukd}
LUKCLI=${LUKCLI:-$SRCDIR/luk-cli}
LUKTX=${LUKTX:-$SRCDIR/luk-tx}
LUKQT=${LUKQT:-$SRCDIR/qt/luk-qt}

[ ! -x $LUKD ] && echo "$LUKD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
LUKVER=($($LUKCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for lukd if --version-string is not set,
# but has different outcomes for luk-qt and luk-cli.
echo "[COPYRIGHT]" > footer.h2m
$LUKD --version | sed -n '1!p' >> footer.h2m

for cmd in $LUKD $LUKCLI $LUKTX $LUKQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${LUKVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${LUKVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
