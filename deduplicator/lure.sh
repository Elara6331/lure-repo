name='deduplicator'
version='0.1.3'
release='1'
desc='Find, Sort, Filter & Delete duplicate files'
homepage='https://github.com/sreedevk/deduplicator'
maintainer="Евгений Храмов <xpamych@yandex.ru>"
architectures=('amd64')
license=('MIT')
provides=('deduplicator')
conflicts=('deduplicator')
#deps=('')
build_deps=('cargo')

sources=("git+https://github.com/sreedevk/deduplicator.git#tag=v${version}")
checksums=('SKIP')

build() {
	cd "${srcdir}/deduplicator"
	cargo build
}

package() {
	install -Dm755 "${srcdir}/${name}/target/debug/deduplicator" "${pkgdir}/usr/bin/deduplicator"
}
