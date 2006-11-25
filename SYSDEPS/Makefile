default: sysdeps
clean: sysdeps_clean

sysdeps:  sd_aio-mech sd_select sd_int64 sd_corelib-flags sd_corelib-libs-S
sysdeps_clean:  sd_aio-mech_clean sd_select_clean sd_int64_clean sd_corelib-flags_clean sd_corelib-libs-S_clean

sd_aio-mech:
	@(cd aio-mech && ./run)
sd_aio-mech_clean:
	@(cd aio-mech && ./clean)

sd_select:
	@(cd select && ./run)
sd_select_clean:
	@(cd select && ./clean)

sd_int64:
	@(cd int64 && ./run)
sd_int64_clean:
	@(cd int64 && ./clean)

sd_corelib-flags:
	@(cd corelib-flags && ./run)
sd_corelib-flags_clean:
	@(cd corelib-flags && ./clean)

sd_corelib-libs-S:
	@(cd corelib-libs-S && ./run)
sd_corelib-libs-S_clean:
	@(cd corelib-libs-S && ./clean)

regen:
	./gen-makefile > Makefile.tmp
	mv Makefile.tmp Makefile
