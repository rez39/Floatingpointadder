# Floatingpointadder
Verilog implemenation of 32 bit Floating point adder for Normal numbers<br/>
Expected Results:<br/>
Inputs IEEE754 standard Hexadecimal Decimal<br/>
equivalent<br/>
a=3 0 10000000 10000000000000000000000 0x40400000 1077936128<br/>
b=3 0 10000000 10000000000000000000000 0x40400000 1077936128<br/>
Inputs IEEE754 standard Hexadecimal Decimal<br/>
equivalent<br/>
a=1.5 *2-126 0 00000001 10000000000000000000000 0x00c00000 12582912<br/>
b=1.5 *2-126 0 00000001 10000000000000000000000 0x00c00000 12582912<br/>
Acceleration<br/>
The execution time is 0.00100s == 1 kHz. (C code execution time)<br/>
The execution time on FPGA is 10.000ns==100.000 MHz<br/>
Output(a+b) IEEE754 standard Hexadecimal Decimal<br/>
equivalent<br/>
6 0 10000001 10000000000000000000000 0x40c00000 1086324736<br/>
Output(a+b) IEEE754 standard Hexadecimal Decimal<br/>
equivalent<br/>
3*2-126 0 00000010 10000000000000000000000 0x01400000 20971520<br/>
