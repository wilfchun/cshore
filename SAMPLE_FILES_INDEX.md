# CSHORE Sample & Test Files - Complete Index

## Quick Overview

The CSHORE repository includes **15+ ready-to-use test cases** with real field and laboratory data. All can be run immediately with the compiled binaries.

## Example Input Files (Fastest)

Located: `usace_distribute_bundle/example_infiles/`

### 1. structure.infile
- **Size:** 2.1 KB
- **Runtime:** ~10 seconds
- **Purpose:** Minimal structural test
- **Best for:** Quick validation, build verification
- **Command:**
  ```bash
  ./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/example_infiles/structure.infile
  ```

### 2. movable.infile ⭐ RECOMMENDED
- **Size:** 11.8 KB
- **Runtime:** ~30 seconds
- **Purpose:** Idealized planar beach slope with morphology
- **Best for:** Standard testing, feature demonstration
- **Features:** Waves, water level variations, sediment transport
- **Command:**
  ```bash
  ./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/example_infiles/movable.infile
  ```

### 3. fixed.infile
- **Size:** 11.6 KB
- **Runtime:** ~20 seconds
- **Purpose:** Fixed beach (no morphology)
- **Best for:** Hydrodynamic testing
- **Features:** Wave transformation, no sediment transport

### 4. hardbottom.infile
- **Size:** 18.9 KB
- **Runtime:** ~1 minute
- **Purpose:** Hard bottom beach
- **Best for:** Complex bottom testing
- **Features:** Limited sediment availability, hard substrate

### 5. iveg1.infile
- **Size:** 25.6 KB
- **Runtime:** ~2-5 minutes
- **Purpose:** Beach with vegetation effects
- **Best for:** Vegetation modeling (IVEG=1)
- **Features:** Vegetation damping, wave reduction

## Test Bed Cases (Real Data)

Located: `usace_distribute_bundle/testbed/`

### Laboratory Experiments

#### supertank_p5a ⭐ HIGHLY RECOMMENDED
- **Type:** Laboratory flume experiment
- **Scenario:** Dune erosion test (P5A)
- **Runtime:** ~1-2 minutes
- **Data Source:** USDA ASCE field data
- **Files:** `infile`
- **Features:** Complete dune evolution with overtopping
- **Command:**
  ```bash
  ./bin/CSHORE_USACE_LINUX.out < testbed/supertank_p5a/infile
  ```

#### supertank_p6a
- **Type:** Laboratory flume experiment
- **Scenario:** Additional dune test (P6A)
- **Runtime:** ~1-2 minutes
- **Data Source:** Lab-controlled conditions
- **Files:** `infile`

#### gee
- **Type:** Laboratory test
- **Runtime:** ~30-60 seconds
- **Best for:** Beach profile change testing

#### dette
- **Type:** Laboratory data
- **Runtime:** Variable
- **Best for:** Erosion/accretion studies

#### lstf
- **Type:** Lab scale test facility
- **Runtime:** Variable
- **Best for:** Detailed process analysis

### Field Data - Coastal

#### rehoboth
- **Location:** Rehoboth Beach, Delaware
- **Type:** Field monitoring data
- **Runtime:** ~1-2 minutes
- **Data:** Real coastal conditions
- **File:** `infile`

#### dewey_140
- **Type:** Field coastal monitoring
- **Runtime:** ~1-2 minutes
- **Best for:** Real beach evolution
- **File:** `infile`

#### agate
- **Type:** Field data with multiple time steps
- **Runtime:** Variable (multiple scenarios)
- **Files:** `201309292100.infile`, `201310161100.infile`
- **Best for:** Multi-scenario analysis

### Field Data - Specific Phenomena

#### frf_general_morpho
- **Location:** Field Research Facility
- **Focus:** General beach morphology
- **Runtime:** ~2-3 minutes
- **Files:** Multiple `*.infile` files
- **Best for:** Beach evolution studies
- **Example:** `071.infile`

#### frf_bathyduck_runup
- **Location:** Field Research Facility
- **Focus:** Wave runup processes
- **Runtime:** ~1-2 minutes each
- **Files:** `2.infile`, `3.infile`
- **Best for:** Wave runup and overwash analysis

## Usage Examples

### Run All Tests Automatically
```bash
devenv shell
./test_binaries.sh
```

### Quick Test (10 seconds)
```bash
devenv shell
./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/example_infiles/structure.infile
```

### Standard Test (30 seconds)
```bash
./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/example_infiles/movable.infile
```

### Lab Experiment (1-2 minutes)
```bash
./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/testbed/supertank_p5a/infile
```

### Field Data (2-3 minutes)
```bash
./bin/CSHORE_USACE_LINUX.out < usace_distribute_bundle/testbed/frf_general_morpho/071.infile
```

### From Any Directory
```bash
cd /tmp
cp /home/wilfchun/CSHORE/cshore/usace_distribute_bundle/example_infiles/movable.infile ./infile
/home/wilfchun/CSHORE/cshore/usace_distribute_bundle/bin/CSHORE_USACE_LINUX.out < infile
```

## Output Files

Each test generates output files in the current directory:

| File | Contents |
|------|----------|
| **outfile** | Summary results and messages |
| **fort.21** | Wave heights at each grid point |
| **fort.22** | Water levels/surge |
| **fort.30** | Bottom elevation changes |
| **fort.31** | Sediment transport rates |

## Analyzing Results

Use the MATLAB tools included:

```matlab
cd usace_distribute_bundle/mfiles
addpath('.')

% Load results
results = load_results_usace;

% Plot results
plot_results_usace;
```

## Test Complexity & Runtime Summary

| File | Type | Runtime | Complexity | Best For |
|------|------|---------|-------------|----------|
| structure.infile | Example | 10 sec | Very Simple | Validation |
| movable.infile | Example | 30 sec | Simple | Standard test |
| fixed.infile | Example | 20 sec | Simple | Hydro testing |
| hardbottom.infile | Example | 1 min | Medium | Bottom test |
| iveg1.infile | Example | 2-5 min | Complex | Vegetation |
| supertank_p5a | Lab | 1-2 min | Medium | Lab erosion |
| supertank_p6a | Lab | 1-2 min | Medium | Lab experiment |
| frf_general_morpho | Field | 2-3 min | Complex | Beach evolution |
| frf_bathyduck_runup | Field | 1-2 min | Complex | Wave runup |
| rehoboth | Field | 1-2 min | Medium | Real beach |
| dewey_140 | Field | 1-2 min | Medium | Real conditions |
| agate | Field | Variable | Variable | Multi-step |

## Next Steps

1. **Read:** `TEST_CASES.md` for detailed test information
2. **Try:** `./test_binaries.sh` for automated testing
3. **Run:** A quick test manually
4. **Explore:** Different test cases
5. **Analyze:** Results with MATLAB tools

## Files Checklist

Quick reference for all test locations:

```
usace_distribute_bundle/
├── example_infiles/
│   ├── structure.infile ✓
│   ├── movable.infile ✓
│   ├── fixed.infile ✓
│   ├── hardbottom.infile ✓
│   └── iveg1.infile ✓
│
├── testbed/
│   ├── supertank_p5a/infile ✓
│   ├── supertank_p6a/infile ✓
│   ├── rehoboth/infile ✓
│   ├── dewey_140/infile ✓
│   ├── agate/201309292100.infile ✓
│   ├── agate/201310161100.infile ✓
│   ├── gee/infile ✓
│   ├── dette/
│   ├── lstf/
│   ├── frf_general_morpho/071.infile ✓
│   └── frf_bathyduck_runup/2.infile, 3.infile ✓
│
├── example_application/
│   └── run_model.m (MATLAB script)
│
└── mfiles/
    ├── load_results_usace.m
    ├── plot_results_usace.m
    ├── makeinfile_usace.m
    └── ... (more tools)
```

## Troubleshooting

**Binary not found?**
```bash
devenv shell && ./build.sh release
```

**Test doesn't produce output?**
- Check directory is writable: `touch test.txt && rm test.txt`
- Some tests only output to stdout
- Try: `./bin/CSHORE_USACE_LINUX.out < infile`

**Need to understand input file format?**
- See: `usace_distribute_bundle/example_infiles/`
- Each file has clear parameter structure

**Want to create your own test?**
- Use `makeinfile_usace.m` MATLAB script
- Or copy existing infile and modify parameters

## References

- Academic papers: `usace_distribute_bundle/doc/` (PDF)
- MATLAB tools documentation: See `usace_distribute_bundle/mfiles/`
- Test case MATLAB scripts: Each testbed dir has `make_infile.m`
