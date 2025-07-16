rot.blif: rot.v rot.pcf
	yosys --quiet --commands "synth_ice40 -blif rot.blif.new" rot.v \
	  && mv rot.blif.new rot.blif

rot.txt: rot.blif
	arachne-pnr -p rot.pcf rot.blif -o rot.txt.new && mv rot.txt.new rot.txt

rot.ex: rot.txt
	icebox_explain rot.txt > rot.ex.new && mv rot.ex.new rot.ex

rot.bin: rot.txt rot.ex
	icepack rot.txt rot.bin.new && mv rot.bin.new rot.bin

load: rot.bin
	./ice4pi_prog rot.bin
#	iceprog rot.bin

clean:
	rm -f rot.blif rot.txt rot.ex rot.bin
