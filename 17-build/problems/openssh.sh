#in openssh/build
#error in -fstack-protector-strong 
#/home/buchmann/fhnw/edu/tinL/17-build/tc/bin/arm-linux-gnueabihf-gcc \
#-o conftest -g -O2 \
# -fPIE   \
#-Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack \
#-fstack-protector-strong \
#-pie \
#conftest.c \
#-lcrypto -ldl -lutil -lz -lnsl

/home/buchmann/fhnw/edu/tinL/17-build/tc/bin/arm-linux-gnueabihf-gcc  \
--sysroot=/home/buchmann/fhnw/edu/tinL/17-build/target-root -o conftest -g -O2 \
-Wall -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess \
-Wno-pointer-sign -Wno-unused-result -fno-strict-aliasing \
-D_FORTIFY_SOURCE=2 -ftrapv -fno-builtin-memset -fPIE \
-I/usr/local/ssl/include  \
-L/usr/local/ssl/lib  \
-Wl,-z,relro \
-Wl,-z,now \
-Wl,-z,noexecstack \
-pie \
conftest.c -lcrypto -ldl -lutil -lz -lnsl



