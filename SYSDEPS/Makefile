default: sysdeps
clean: sysdeps_clean

sysdeps:  sd_aio-mech sd_select
sysdeps_clean:  sd_aio-mech_clean sd_select_clean

sd_aio-mech:
	@(cd aio-mech && ./run)
sd_aio-mech_clean:
	@(cd aio-mech && ./clean)

sd_select:
	@(cd select && ./run)
sd_select_clean:
	@(cd select && ./clean)

regen:
	./gen-makefile > Makefile.tmp
	mv Makefile.tmp Makefile
