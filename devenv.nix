{ pkgs
, lib
, config
, devenv-zsh
, ...
}:
{
  cachix.pull = [ "devenv" ];
  # https://devenv.sh/languages/
  languages = {
    cplusplus.enable = true;
    fortran.enable = true;
  };
  imports = [ devenv-zsh.plugin ];
  zsh.enable = true;

  languages.python = {
    enable = true;
    version = "3.13";
  };

  # https://devenv.sh/packages/
  packages = with pkgs; [
    gfortran15
    libgcc
    gcc15
    cmake
    gfortran.cc.lib
    # Python
    python313Packages.rasterio
    python313Packages.fiona
    python313Packages.seaborn
    python313Packages.matplotlib
    python313Packages.pandas
    python313Packages.geopandas
    python313Packages.polars
    python313Packages.geoarrow-pyarrow
    python313Packages.numpy
    python313Packages.pyyaml
  ];

  # Add OpenMP flags to compiler and linker
  enterShell =
    # sh
    ''
      export CFLAGS="$CFLAGS -fopenmp"
      export LDFLAGS="$LDFLAGS -fopenmp"
      # zsh
    '';
  env = {
    NIX_ENFORCE_NO_NATIVE = "0";
  };
  # 3. Environment Fixes
  # specific fix for Python plotting libraries finding C libraries on NixOS
  env.LD_LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
    pkgs.geos
  ];

  # Optional: specific pre-commit hooks for both languages
  git-hooks.hooks = {
    black.enable = true; # Python formatter
  };

  # See full reference at https://devenv.sh/reference/options/
}

