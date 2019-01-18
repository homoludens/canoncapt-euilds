# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit multilib eutils rpm versionator
MY_P=${P/_p/-}-1

DESCRIPTION="Common files for the Canon CUPS Capt driver"
HOMEPAGE="http://www.canon.com/"

MY_PV="$(delete_all_version_separators)"
#SOURCES_NAME="Linux_CAPT_PrinterDriver_V${MY_PV}_uk_EN"
SOURCES_NAME="linux-capt-drv-v${MY_PV}-uken.tar.gz"
#SRC_URI="http://gdlp01.c-wss.com/gds/6/0100004596/03/${SOURCES_NAME}.tar.gz"
SRC_URI="http://gdlp01.c-wss.com/gds/6/0100004596/05/linux-capt-drv-v271-uken.tar.gz"

LICENSE="CANON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-cngplp"    # enable or disable cngplp compilation, may cause build break on ~amd64, don't really know if cngplp is ever needed
RESTRICT=""

DEPEND=">=net-print/cups-1.1.17
        >=x11-libs/gtk+-2.4.0
        >=gnome-base/libglade-2.4.0"

S=${WORKDIR}/${PN}-$(get_version_component_range 1-2)

dir=/usr/$(get_libdir)
CNGPLP=""

QA_TEXTRELS="${dir:1}/libcaepcm.so.1.0
        ${dir:1}/libc3pl.so.0.0.1
        ${dir:1}/libcnlbcm.so.1.0
        ${dir:1}/libcaiousb.so.1.0.0"

S=${WORKDIR}/${SOURCES_NAME}/Src/${P/_p/-}-1

src_unpack() {
    if [ "${A}" != "" ]; then
        unpack ${A}
        cd "${WORKDIR}/linux-capt-drv-v271-uken/Src/"
        unpack ./cndrvcups-common-3.21-1.tar.gz
        cd cndrvcups-common-3.21

    fi
}

src_prepare() {
	    echo "  "
        echo "TESTTT11111111"
        echo `pwd`
        echo "  "
		make gen
    cd linux-capt-drv-v271-uken/
	epatch "${FILESDIR}"/cndrvcups-common-3.21-fix-cngplp.patch
	 #export cngplp_LDADD= -lglade-2.0  -lcups -lgtk-x11-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0

#    export "LIBS=-lgmodule-2.0"
}

#src_configure(){
 #       make gen
        #use cngplp && CNGPLP="cngplp"
#}

src_compile() {

		cd linux-capt-drv-v271-uken/Src/cndrvcups-common-3.21

	    echo "  "
        echo "TESTTT2222222222"
        echo `pwd`
        echo "  "
		make gen
}

src_install() {
		cd linux-capt-drv-v271-uken/Src/cndrvcups-common-3.21
	    echo "  "
        echo "TESTTT33333333333"
        echo `pwd`
        echo "  "
		make install
}
