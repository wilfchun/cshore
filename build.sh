#!/bin/bash
# ============================================================================
# CSHORE Build Wrapper Script
# ============================================================================
# Convenience wrapper for building CSHORE Fortran code
# Uses gfortran from devenv (requires: devenv shell)
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_help() {
	cat <<EOF
CSHORE Build Wrapper - Usage

Syntax: ./build.sh [TARGET]

Available targets:
    release   - Build optimized release binaries (default)
    debug     - Build debug binaries with runtime checks
    clean     - Remove build artifacts
    distclean - Remove all built files
    install   - Build and display summary
    help      - Display this help message
    info      - Show build configuration

Examples:
    ./build.sh release
    ./build.sh debug
    ./build.sh clean

Requirements:
    - Must run within 'devenv shell' environment
    - gfortran is provided by devenv.nix

Notes:
    - All compilation happens in src-repo/
    - Binaries are output to usace_distribute_bundle/bin/

EOF
}

# Check if we're in devenv
if [ -z "$DEVENV_PROFILE" ]; then
	echo -e "${YELLOW}⚠️  Warning: Not running in devenv environment${NC}"
	echo ""
	echo "To enter the devenv, run:"
	echo "  devenv shell"
	echo ""
	echo "Then retry your build command."
	echo ""

	# Try to check if gfortran is available anyway
	if ! command -v gfortran &>/dev/null; then
		echo -e "${RED}❌ Error: gfortran not found in PATH${NC}"
		exit 1
	fi
	echo -e "${GREEN}✓ gfortran found in PATH, proceeding...${NC}"
fi

# Main script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

TARGET="${1:-release}"

case "$TARGET" in
release | debug | clean | distclean | install | help | info | all)
	echo -e "${GREEN}Building CSHORE...${NC}"
	echo "Target: $TARGET"
	echo ""
	cd src-repo
	make $TARGET
	;;
*)
	echo -e "${RED}Error: Unknown target '$TARGET'${NC}"
	echo ""
	print_help
	exit 1
	;;
esac
