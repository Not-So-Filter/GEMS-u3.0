@echo off
if not exist OUT mkdir OUT

"TOOL/AS/asw" -xx -q -A -L -E -i . "GEMS/gemsz80 AS.asm"
"TOOL/AS/p2bin" -p=0 -z=0,uncompressed,Size_of_DAC_driver_guess,after "GEMS/gemsz80 AS.p" "OUT/GEMS/GEMSZ80.BIN"
del "GEMS/gemsz80 AS.p"
pause

"TOOL/vasmm68k_psi-x.exe" -altlocal -m68000 -maxerrors=0 -Fbin -start=0 -o "OUT/GEMS.BIN" -L "OUT/GEMS.LST" -Lall "SRC/MAIN.S" 2> _errors.log
type _errors.log
del _errors.log
pause