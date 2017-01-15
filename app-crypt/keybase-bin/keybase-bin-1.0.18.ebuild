# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit fdo-mime font gnome2-utils eutils versionator

DESCRIPTION="Desktop binary client for keybase.io"
HOMEPAGE="http://keybase.io/"

KEYWORDS="~amd64 ~x86"

SRC_URI="
amd64? (https://prerelease.keybase.io/keybase_amd64.deb)
x86? (https://prerelease.keybase.io/keybase_i386.deb)
"

SLOT="0"
RESTRICT="strip mirror" # mirror as explained at bug #547372
LICENSE="BSD"
IUSE=""

UNBUNDLED_LIBS="
"

NATIVE_DEPEND="
	sys-fs/fuse
"
RDEPEND="
	${NATIVE_DEPEND}
"

DEPEND="
	!app-crypt/keybase
	!app-crypt/kbfs
"

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.xz
}

src_install() {
	doins -r opt
	doins -r usr
	fperms 755 /usr/bin/kbfsfuse
	fperms 755 /usr/bin/keybase
	fperms 755 /usr/bin/run_keybase
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
