BIN_PREFIX=/root/app/riscv64b/bin/riscv64-unknown-elf
GPP=$(BIN_PREFIX)-g++
OBJDUMP=$(BIN_PREFIX)-objdump

main:
	if [ ! -d "deps/intx" ]; then \
		cd deps; \
		git clone --single-branch --branch riscv_b_extension https://github.com/libraries/intx; \
	fi
	$(GPP) -g -fno-exceptions -Os -march=rv64gcb -Ic -Ideps/intx/include -o build/bn256g2 c/bn256g2.cpp
	$(OBJDUMP) -d build/bn256g2 > build/bn256g2.objdump
