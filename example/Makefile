rot.bin: rot.v rot.pcf
	yosys -q -p "synth_ice40 -json rot.json" rot.v
	nextpnr-ice40 --hx1k --package tq144 --json rot.json --pcf rot.pcf --asc rot.txt
	icebox_explain rot.txt > rot.ex
	icepack rot.txt rot.bin

load: rot.bin
	./ice4pi_prog rot.bin
#	iceprog rot.bin

clean:
	rm -f rot.json rot.txt rot.ex rot.bin
