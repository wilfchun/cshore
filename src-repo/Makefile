# ============================================================================
# CSHORE Fortran Build System
# ============================================================================
# A numerical model for predicting beach evolution in the nearshore region
# Reference: Kobayashi et al. 2009
#
# Compiler: gfortran (via Nix on this system)
# Author: Auto-generated
# ============================================================================

# ============================================================================
# Configuration
# ============================================================================

# Fortran compiler and flags
# Note: gfortran is provided by devenv.nix - ensure you're in 'devenv shell'
FC := gfortran
FFLAGS := -Wall -Wextra -pedantic -fimplicit-none
FFLAGS_DEBUG := -g -O0 -fbacktrace -fbounds-check -fcheck=all
FFLAGS_RELEASE := -O2 -march=native

# Default to release build
FFLAGS += $(FFLAGS_RELEASE)

# Output directories
BIN_DIR := ../bin
OBJ_DIR := ./obj
MOD_DIR := ./mod

# Source files
SOURCES := CSHORE_USACE.f CSHORE_USACE_DEPTH_DEP.f
OBJECTS := $(addprefix $(OBJ_DIR)/,$(SOURCES:.f=.o))
TARGETS := CSHORE_USACE_LINUX.out CSHORE_USACE_DEPTH_DEP.out

# ============================================================================
# Phony Targets
# ============================================================================

.PHONY: all release debug clean install help directories

# ============================================================================
# Default Target
# ============================================================================

all: release

# ============================================================================
# Build Targets
# ============================================================================

# Release build (optimized)
release: FFLAGS = -Wall -Wextra -O2 -march=native
release: directories $(addprefix $(BIN_DIR)/,$(TARGETS))
	@echo ""
	@echo "✓ Release build complete"
	@echo "  Executables: $(addprefix $(BIN_DIR)/,$(TARGETS))"

# Debug build (with debugging symbols and bounds checking)
debug: FFLAGS = -Wall -Wextra -g -O0 -fbacktrace -fbounds-check -fcheck=all
debug: directories $(addprefix $(OBJ_DIR)/,$(TARGETS))
	@echo ""
	@echo "✓ Debug build complete"
	@echo "  Executables: $(addprefix $(OBJ_DIR)/,$(TARGETS))"

# Standard version
$(BIN_DIR)/CSHORE_USACE_LINUX.out: $(OBJ_DIR)/CSHORE_USACE.o
	@echo "Linking: $@"
	$(FC) $(FFLAGS) -o $@ $<
	@echo "  ✓ Created: $@"

# Depth-dependent version
$(BIN_DIR)/CSHORE_USACE_DEPTH_DEP.out: $(OBJ_DIR)/CSHORE_USACE_DEPTH_DEP.o
	@echo "Linking: $@"
	$(FC) $(FFLAGS) -o $@ $<
	@echo "  ✓ Created: $@"

# Debug versions
$(OBJ_DIR)/CSHORE_USACE_LINUX.out: $(OBJ_DIR)/CSHORE_USACE.o
	@echo "Linking (debug): $@"
	$(FC) $(FFLAGS) -o $@ $<

$(OBJ_DIR)/CSHORE_USACE_DEPTH_DEP.out: $(OBJ_DIR)/CSHORE_USACE_DEPTH_DEP.o
	@echo "Linking (debug): $@"
	$(FC) $(FFLAGS) -o $@ $<

# Object files
$(OBJ_DIR)/%.o: %.f
	@echo "Compiling: $<"
	$(FC) $(FFLAGS) -c -J$(MOD_DIR) -o $@ $<

# ============================================================================
# Directory Management
# ============================================================================

directories:
	@mkdir -p $(OBJ_DIR) $(MOD_DIR) $(BIN_DIR)
	@echo "✓ Created directories: $(OBJ_DIR), $(MOD_DIR), $(BIN_DIR)"

# ============================================================================
# Installation
# ============================================================================

install: release
	@echo ""
	@echo "Installation Summary:"
	@echo "  Release binaries installed in: $(BIN_DIR)/"
	@ls -lh $(BIN_DIR)/CSHORE_USACE*.out

# ============================================================================
# Cleaning
# ============================================================================

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OBJ_DIR) $(MOD_DIR)
	@echo "✓ Cleaned: $(OBJ_DIR), $(MOD_DIR)"

distclean: clean
	@echo "Removing all built files..."
	@rm -f $(BIN_DIR)/CSHORE_USACE_LINUX.out $(BIN_DIR)/CSHORE_USACE_DEPTH_DEP.out
	@echo "✓ Removed binaries from $(BIN_DIR)"

# ============================================================================
# Help
# ============================================================================

help:
	@echo ""
	@echo "CSHORE Makefile - Usage"
	@echo "======================================================================"
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "  make all              Build all targets (default: release)"
	@echo "  make release          Build optimized release binaries"
	@echo "  make debug            Build debug binaries with runtime checks"
	@echo "  make install          Build and display installation summary"
	@echo "  make clean            Remove build artifacts (obj/, mod/)"
	@echo "  make distclean        Remove all built files including binaries"
	@echo "  make help             Display this help message"
	@echo ""
	@echo "Examples:"
	@echo ""
	@echo "  make release          # Build optimized version"
	@echo "  make debug            # Build debug version with bounds checking"
	@echo "  make clean            # Clean build artifacts"
	@echo ""
	@echo "Output:"
	@echo ""
	@echo "  Release binaries:  $(BIN_DIR)/"
	@echo "  Object files:      $(OBJ_DIR)/"
	@echo "  Module files:      $(MOD_DIR)/"
	@echo ""
	@echo "Compiler: $(FC)"
	@echo "======================================================================"
	@echo ""

# ============================================================================
# Info Target (for debugging)
# ============================================================================

info:
	@echo "Makefile Configuration:"
	@echo "  Compiler: $(FC)"
	@echo "  Compiler Flags: $(FFLAGS)"
	@echo "  Sources: $(SOURCES)"
	@echo "  Targets: $(TARGETS)"
	@echo "  Directories:"
	@echo "    - Binary: $(BIN_DIR)"
	@echo "    - Object: $(OBJ_DIR)"
	@echo "    - Module: $(MOD_DIR)"

# ============================================================================
