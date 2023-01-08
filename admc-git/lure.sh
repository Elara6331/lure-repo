name='admc-git'
version='3568.6dbb92e'
release='1'
desc='user-friendly инструмент для Linux для работы с доменом Active Directory и групповыми политиками.'
homepage='https://github.com/altlinux/admc.git'
maintainer="Евгений Храмов <xpamych@yandex.ru>"
architectures=('amd64')
license=('GPL-3.0-or-later')
provides=('admc')
conflicts=('admc')

build_deps=('cmake' 'gcc' 'gcc-c++' 'qt5-qtbase-devel' 'qt5-linguist' 'openldap-devel' 'samba-devel' 'libsmbclient-devel' 'krb5-devel' 'libuuid-devel')
build_deps_debian=('cmake' 'debhelper' 'qtbase5-dev' 'qttools5-dev' 'libldap2-dev' 'samba-dev' 'libsmbclient-dev' 'libkrb5-dev' 'uuid-dev' 'libsasl2-dev')

sources=("git+https://github.com/altlinux/${provides}.git")
checksums=('SKIP')

version() {
	cd "$srcdir/${provides}"
	git-version
}

prepare() {
	cd "${srcdir}/${provides}"
	mkdir build
}

build() {
	cd "${srcdir}/${provides}/build"
	cmake ..
	make -j12
}

package() {
	install -Dm755 "${srcdir}/${provides}/build/admc" "${pkgdir}/usr/bin/admc"
	install -Dm644 "${srcdir}/${provides}/build/libadldap.so" "${pkgdir}/usr/lib/libadldap.so"
	install -Dm644 "${srcdir}/${provides}/share/admc.desktop" "${pkgdir}/usr/share/applications/admc.desktop"
	install -Dm644 "${srcdir}/${provides}/share/admc.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/admc.svg"
}