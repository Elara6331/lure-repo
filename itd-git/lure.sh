name='itd-git'
version='188.271510d'
release=1
desc='Companion daemon for the InfiniTime firmware on the PineTime smartwatch'
desc_ru='Демон-компаньон для прошивки InfiniTime на смарт-часах PineTime'
maintainer='Elara Musayelyan <elara@elara.ws>'
maintainer_ru='Элара Мусаелян <elara@elara.ws>'
homepage='https://gitea.elara.ws/Elara6331/itd'
architectures=('amd64' 'arm64' 'arm7' 'arm6' '386')
license=('GPL-3.0-or-later')
provides=('itd' 'itctl')
conflicts=('itd' 'itctl')

build_deps=('golang')
build_deps_arch=('go')
build_deps_alpine=('go')
build_deps_opensuse=('go')

deps=('dbus' 'bluez' 'pulseaudio-utils')
deps_arch=('dbus' 'bluez' 'libpulse')
deps_opensuse=('dbus-1' 'bluez' 'pulseaudio-utils')

sources=("git+https://gitea.elara.ws/Elara6331/itd.git")
checksums=('SKIP')

backup=('/etc/itd.toml')

version() {
	cd "$srcdir/itd"
	git-version
}

build() {
	cd "$srcdir/itd"
	make
}

package() {
	cd "$srcdir/itd"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
