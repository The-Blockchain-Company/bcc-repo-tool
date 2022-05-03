{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "contra-tracer"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2019 TBCO";
      maintainer = "operations@tbco.io";
      author = "Neil Davies, Alexander Diemand, Andreas Triantafyllos";
      homepage = "";
      url = "";
      synopsis = "A simple interface for logging, tracing or monitoring.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.5") (hsPkgs.contravariant);
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/tbco-monitoring-framework";
      rev = "2493b1104caa6d32378d0cb72d3fa92916b5570b";
      sha256 = "2820c5dda441c35f2adce5dbbe97ebcf0fe3c28ea46f42d9851aa76086562ddb";
      });
    postUnpack = "sourceRoot+=/contra-tracer; echo source root reset to \$sourceRoot";
    }
