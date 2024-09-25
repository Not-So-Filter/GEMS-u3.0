@echo off
if not exist OUT mkdir OUT

"TOOL/AS/asl" -xx -q -A -L -E -i . "GEMS/gemsz80 AS.asm"
"TOOL/AS/p2bin" "GEMS/gemsz80 AS.p" "OUT/GEMS/GEMSZ80.BIN"
pause

"TOOL/vasmm68k_psi-x.exe" -altlocal -m68000 -maxerrors=0 -Fbin -start=0 -o "OUT/GEMS.BIN" -L "OUT/GEMS.LST" -Lall "SRC/MAIN.S" 2> _errors.log
type _errors.log
del _errors.log
pause