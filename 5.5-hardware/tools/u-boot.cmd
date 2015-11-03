U Boot
------
USR0= 1<<21 0x0200000
USR1= 1<<22 0x0400000
USR2= 1<<23 0x0800000
USR3= 1<<24 0x1000000
USR =       0x1700000   all leds
            0x8fffff    ~all leds
GPIO1       =0x4804c000  the base address
OE          =     0x134  0x4804c134  Output enable
CLEARDATAOUT=     0x190  0x4804c190
SETDATAOUT  =     0x194  0x4804c194

mw memory write

