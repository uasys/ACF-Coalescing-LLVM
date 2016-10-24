include ../../common/make.config

NVCC := $(CUDA_DIR)/bin/nvcc
INCLUDE := $(CUDA_DIR)/include

SRC = pathfinder.cu

EXE = pathfinder

release:
	$(NVCC) $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR)

enum:
	$(NVCC) -deviceemu $(SRC) -o $(EXE) -I$(INCLUDE) -L$$(CUDA_LIB_DIR)

debug:
	$(NVCC) -g $(SRC) -o $(EXE) -I$(INCLUDE) -L$$(CUDA_LIB_DIR)

debugenum:
	$(NVCC) -g -deviceemu $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR)

clean:
	rm -f pathfinder
