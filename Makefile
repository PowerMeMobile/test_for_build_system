
BUILD_D=build
BIN_D=build/bin
SRC_D=src

MKDIR=mkdir
RMDIR=$(RM) -d

GMCS=gmcs
CSFLAGS=-debug -r:System.dll

SRC_LIST=$(SRC_D)/Program.cs $(SRC_D)/Tool.cs

all: $(BIN_D)/Program.exe

clean:
	$(RM) $(BIN_D)/Program.exe
	$(RM) $(BIN_D)/Program.exe.mdb
	$(RMDIR) $(BIN_D)
	$(RMDIR) $(BUILD_D)

$(BUILD_D):
	$(MKDIR) $(BUILD_D)

$(BIN_D): $(BUILD_D)
	$(MKDIR) $(BIN_D)

$(BIN_D)/Program.exe $(BIN_D)Program.exe.mdb: $(BIN_D) $(SRC_LIST)
	$(GMCS) $(CSFLAGS) -out:$(BIN_D)/Program.exe $(SRC_LIST)


