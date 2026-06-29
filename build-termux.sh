#!/data/data/com.termux/files/usr/bin/sh
set -eu

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
JOBS="${JOBS:-$(nproc)}"

make distclean 2>/dev/null || true
rm -f config.status

./autogen.sh

export CPPFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"

cpu_flags="-march=armv8-a+crypto+crc"
if printf 'int main(void){return 0;}\n' | \
   ${CC:-cc} -x c - -c -o /tmp/cpuminer-termux-cpu-test.o -mcpu=native >/dev/null 2>&1; then
  cpu_flags="-mcpu=native"
fi
rm -f /tmp/cpuminer-termux-cpu-test.o

CFLAGS="-std=gnu99 -O3 $cpu_flags -pipe -fomit-frame-pointer -Wall -flax-vector-conversions" \
  ./configure --prefix="$PREFIX" --with-curl="$PREFIX" --disable-assembly

make -j"$JOBS"
strip -s cpuminer 2>/dev/null || true

echo
echo "Built ./cpuminer"
echo "CFLAGS: -std=gnu99 -O3 $cpu_flags -pipe -fomit-frame-pointer -Wall -flax-vector-conversions"
echo "Example:"
echo './cpuminer -a yescryptr32 -o stratum+tcp://POOL:PORT -u WALLET.WORKER -p x -t 2'
