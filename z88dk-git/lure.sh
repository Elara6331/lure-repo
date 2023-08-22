name='z88dk-git'
version='21023.a09ee3d7a'
release=2
desc='The development kit for Z80 computers'
homepage='https://github.com/z88dk/z88dk'
maintainer='Atirut Wattanamongkol <atirut.wattanamnogkol@gmail.com>'
architectures=('amd64')
license=('MIT')

sources=('git+https://github.com/z88dk/z88dk?~recursive=true')
checksums=('SKIP')


build_deps_ubuntu=('build-essential' 'bison' 'flex' 'libxml2-dev' 'subversion' 'zlib1g-dev' 'm4' 'ragel' 're2c' 'dos2unix' 'texinfo' 'texi2html' 'gdb' 'curl' 'perl' 'cpanminus' 'ccache' 'libboost-all-dev' 'libmodern-perl-perl' 'libyaml-perl' 'liblocal-lib-perl' 'libcapture-tiny-perl' 'libpath-tiny-perl' 'libtext-table-perl' 'libdata-hexdump-perl' 'libregexp-common-perl' 'libclone-perl' 'libfile-slurp-perl' 'make')

version() {
	cd "$srcdir/z88dk"
	git-version
}

build() {
	export BUILD_SDCC=1
	export BUILD_SDCC_HTTP=1
	cd "$srcdir/z88dk"
	./build.sh
}

package() {
	eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
	cpanm App::Prove File::Path CPU::Z80::Assembler Object::Tiny::RW List::Uniq YAML::Tiny
	cd "$srcdir/z88dk"
	PREFIX="$pkgdir/usr/local" make install
}
