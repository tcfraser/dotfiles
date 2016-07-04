# error
bundled/zeromq/src/signaler.cpp:62:25: fatal error: sys/eventfd.h: No such file or directory

# in zeromq directory
export PKG_CONFIG_PATH=/usr/lib/pkgconfig
./configure --without-libsodium
make
gcc -shared -o cygzmq.dll -Wl,--out-implib=libzmq.dll.a -Wl,--export-all-symbols -Wl,--enable-auto-import -Wl,--whole-archive .libs/libzmq.a -Wl,--no-whole-archive -lstdc++
install include/zmq.h  /usr/include
install include/zmq_utils.h  /usr/include
install cygzmq.dll /usr/bin
install libzmq.dll.a /usr/lib

# in pyzmq directory
python3 setup.py build_ext --zmq=/usr --inplace
python3 setup.py install --zmq=/usr --prefix=/usr

# finally!
pip3 install ipython[all]