# Deprecated

This ebuilds are not working since Canon has not released new drivers since 2017 and this one is not possible to build with newer tools and libraries.

There are some open source community efforts here https://github.com/agalakhov/captdriver/ for LBP-2900 and LBP-3000 and here https://github.com/ra1nst0rm3d/captdriver for LPB-1120, other printers might be supported too.


# Ebuilds for Canon CAPT printers

For more information and detailed instructions go here:  
https://wiki.gentoo.org/wiki/Canon_CAPT_Printer

For getting involved go here https://bugs.gentoo.org/show_bug.cgi?id=130612 or just create issue for this repo.

Any help and/or testing would be really helpful.

Add to /usr/local/portage and run:

pushd /usr/local/portage/net-print/cndrvcups-capt && repoman manifest && popd
