
top.bin: top.v top.pcf
	#yosys -q -p "synth_ice40 -top top -blif top.blif" top.v rot.v I2Cslave.v 
	yosys top.ys
	arachne-pnr -p top.pcf top.blif -o top.txt
	icebox_explain top.txt > top.ex
	icepack top.txt top.bin

load: top.bin
	./ice4ultra96_passthrough_prog top.bin
#	./ice4pi_prog top.bin
#	iceprog top.bin

clean:
	rm -f top.blif top.txt top.ex top.bin
