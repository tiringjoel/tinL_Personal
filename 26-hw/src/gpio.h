#pragma once
/*-------------------------------
 gpio
 (c) H.Buchmann FHNW 2018
 25.4
 GPIO 1 @ 0x4804c000
  -------------------------------*/
  
#define GAP(n,from,to) unsigned GAP##n[(to-from)/sizeof(unsigned)]
#define GPIO_1    0x4804c000 
#define GPIO_SIZE 0x1000 
typedef struct 
{
 unsigned REVISION;                // 000h Section 25.4.1.1
 GAP(0,0x004,0x010);
 unsigned SYSCONFIG;               // 010h Section 25.4.1.2
 GAP(1,0x014,0x020);
 unsigned EOI;                     // 020h Section 25.4.1.3
 unsigned IRQSTATUS_RAW_0;         // 024h Section 25.4.1.4
 unsigned IRQSTATUS_RAW_1;         // 028h Section 25.4.1.5
 unsigned IRQSTATUS_0;             // 02Ch Section 25.4.1.6
 unsigned IRQSTATUS_1;             // 030h Section 25.4.1.7
 unsigned IRQSTATUS_SET_0;         // 034h Section 25.4.1.8
 unsigned IRQSTATUS_SET_1;         // 038h Section 25.4.1.9
 unsigned IRQSTATUS_CLR_0;         // 03Ch Section 25.4.1.10
 unsigned IRQSTATUS_CLR_1;         // 040h Section 25.4.1.11
 unsigned IRQWAKEN_0;              // 044h Section 25.4.1.12
 unsigned IRQWAKEN_1;              // 048h Section 25.4.1.13
 GAP(2,0x04c,0x114);
 unsigned SYSSTATUS;               // 114h Section 25.4.1.14
 GAP(3,0x118,0x130);
 unsigned CTRL;                    // 130h Section 25.4.1.15
 unsigned OE;                      // 134h Section 25.4.1.16
 unsigned DATAIN;                  // 138h Section 25.4.1.17
 unsigned DATAOUT;                 // 13Ch Section 25.4.1.18
 unsigned LEVELDETECT0;            // 140h Section 25.4.1.19
 unsigned LEVELDETECT1;            // 144h Section 25.4.1.20
 unsigned RISINGDETECT;            // 148h Section 25.4.1.21
 unsigned FALLINGDETECT;           // 14Ch Section 25.4.1.22
 unsigned DEBOUNCENABLE;           // 150h Section 25.4.1.23
 unsigned DEBOUNCINGTIME;          // 154h Section 25.4.1.24
 GAP(4,0x158,0x190);
 unsigned CLEARDATAOUT;            // 190h Section 25.4.1.25
 unsigned SETDATAOUT;              // 194h Section 25.4.1.26
} GPIO;
