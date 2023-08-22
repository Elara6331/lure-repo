name='lure-git'
version='277.d144a7f'
release=1
desc='Linux User REpository'
homepage='https://gitea.elara.ws/Elara6331/lure'
maintainer='Elara Musayelyan <elara@elara.ws>'
maintainer_ru='Элара Мусаелян <elara@elara.ws>'
architectures=('amd64' 'arm64' 'arm7' 'arm6' '386' 'riscv64')
license=('GPL-3.0-or-later')
provides=('lure')
conflicts=('lure')

build_deps=('golang')
build_deps_arch=('go')
build_deps_alpine=('go')
build_deps_opensuse=('go')

sources=("git+https://gitea.elara.ws/Elara6331/lure.git")
checksums=('SKIP')

version() {
	cd "$srcdir/lure"
	git-version
}

prepare() {
	cd "$srcdir/lure"
	git-version > internal/config/version.txt
}

build() {
	cd "$srcdir/lure"
	CGO_ENABLED=0 go build
}

package() {
	cd "$srcdir/lure"
	install -Dm755 lure ${pkgdir}/usr/bin/lure
	install -Dm755 ./scripts/completion/bash ${pkgdir}/usr/share/bash-completion/completions/lure
	install -Dm755 ./scripts/completion/zsh ${pkgdir}/usr/share/zsh/site-functions/_lure
}
