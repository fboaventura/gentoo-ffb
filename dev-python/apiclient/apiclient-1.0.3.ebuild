# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Framework for making good API client libraries using urllib3"
HOMEPAGE=" https://github.com/shazow/apiclient"
SRC_URI="https://pypi.python.org/packages/b6/5e/08d11020ba6087be7352c8a1856d3a6601f9f1aa7ea434ef1c584b489325/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

# numexpr is optional but set hard rdepend
RDEPEND="
	dev-python/urllib3[${PYTHON_USEDEP}]"
DEPEND="
	dev-python/urllib3[${PYTHON_USEDEP}]
	test? (
		$(python_gen_cond_dep 'dev-python/mock[${PYTHON_USEDEP}]' python2_7)
		$(python_gen_cond_dep 'dev-python/unittest2[${PYTHON_USEDEP}]' python2_7)
	)"

python_prepare_all() {
	if use doc; then
		mkdir doc/_static || die
	fi
	distutils-r1_python_prepare_all
}

python_compile() {
	python_is_python3 || local -x CFLAGS="${CFLAGS} -fno-strict-aliasing"
	distutils-r1_python_compile
}

python_compile_all() {
	use doc && sphinx-build -b html -c doc/ doc/ doc/html
}

python_test() {
	pushd "${BUILD_DIR}"/lib > /dev/null
	"${PYTHON}" -m unittest discover || die
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/html/. )
	distutils-r1_python_install_all
}
