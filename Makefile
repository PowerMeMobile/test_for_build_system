
BUILD_D=build
BIN_D=build/bin
SRC_D=src

MKDIR=mkdir
RMDIR=$(RM) -d
TAR=tar

GMCS=gmcs
CSFLAGS=-debug -r:System.dll

SRC_LIST=$(SRC_D)/Program.cs $(SRC_D)/Tool.cs

all: $(BIN_D)/Program.exe

release: $(BUILD_D)/release-$(VERSION).tgz
	@echo "BUILD-ASSET: $(BUILD_D)/release-$(VERSION).tgz"

$(BUILD_D)/release-$(VERSION).tgz: $(BUILD_D) $(BIN_D)/Program.exe
	$(TAR) cz $(BIN_D) > $(BUILD_D)/release-$(VERSION).tgz

clean:
	$(RM) $(BIN_D)/Program.exe
	$(RM) $(BIN_D)/Program.exe.mdb
	$(RMDIR) $(BIN_D)
	$(RM) -f $(BUILD_D)/release-*.tgz
	$(RMDIR) $(BUILD_D)

$(BUILD_D):
	$(MKDIR) $(BUILD_D)

$(BIN_D): $(BUILD_D)
	$(MKDIR) $(BIN_D)

$(BIN_D)/Program.exe $(BIN_D)Program.exe.mdb: $(BIN_D) $(SRC_LIST)
	$(GMCS) $(CSFLAGS) -out:$(BIN_D)/Program.exe $(SRC_LIST)


