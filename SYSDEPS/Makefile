default: sysdeps
clean: sysdeps_clean

sysdeps:  sd_corelib-flags sd_corelib-libs-S sd_integer-flags sd_integer-libs-S sd_aio-mech sd_sd-select sd_sd-fcntl
sysdeps_clean:  sd_corelib-flags_clean sd_corelib-libs-S_clean sd_integer-flags_clean sd_integer-libs-S_clean sd_aio-mech_clean sd_sd-select_clean sd_sd-fcntl_clean

sd_corelib-flags:
	@(cd modules/corelib-flags && ./run)
sd_corelib-flags_clean:
	@(cd modules/corelib-flags && ./clean)

sd_corelib-libs-S:
	@(cd modules/corelib-libs-S && ./run)
sd_corelib-libs-S_clean:
	@(cd modules/corelib-libs-S && ./clean)

sd_integer-flags:
	@(cd modules/integer-flags && ./run)
sd_integer-flags_clean:
	@(cd modules/integer-flags && ./clean)

sd_integer-libs-S:
	@(cd modules/integer-libs-S && ./run)
sd_integer-libs-S_clean:
	@(cd modules/integer-libs-S && ./clean)

sd_aio-mech:
	@(cd modules/aio-mech && ./run)
sd_aio-mech_clean:
	@(cd modules/aio-mech && ./clean)

sd_sd-select:
	@(cd modules/sd-select && ./run)
sd_sd-select_clean:
	@(cd modules/sd-select && ./clean)

sd_sd-fcntl:
	@(cd modules/sd-fcntl && ./run)
sd_sd-fcntl_clean:
	@(cd modules/sd-fcntl && ./clean)

regen:
	./gen-makefile > Makefile.tmp && mv Makefile.tmp Makefile
