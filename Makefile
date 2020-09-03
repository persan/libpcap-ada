
-include Makefile.conf

all:compile

compile:
	gprbuild -j0 -p -P pcap.gpr

install:uninstall
	gprinstall -p -P pcap.gpr --prefix=${PREFIX}

uninstall:
	-@gprinstall -p -P pcap.gpr --uninstall --prefix=${PREFIX} 2>/dev/null; true


Makefile.conf:Makefile
	@rm -rf ${@}
	@echo "export PATH=${PATH}" >>${@}
	@echo "PREFIX?=$(shell which gnatls)/../.." >>${@}


gen:
	@rm .gen src/gen -rf
	@mkdir -p .gen src/gen
	@echo "extern  \"C\" {" >.gen/gen.cc
	@echo "#include <pcap/pcap.h>" >>.gen/gen.cc
	@echo "}" >>.gen/gen.cc

	cd .gen; g++ -C -c gen.cc -fdump-ada-spec -fada-spec-parent=PCAP.Low_Level
	@cp .gen/pcap-low_level-pcap_*_h.ads src/gen
	@sed -i -f all.sed src/gen/*.ads
	@gnatpp -P pcap.gpr src/gen/*.ads
	@chmod -w src/gen/*.ads
	@gprbuild -p -j0 -P pcap.gpr

test:
	${MAKE} -C tests

clean:
	git clean -xdf
