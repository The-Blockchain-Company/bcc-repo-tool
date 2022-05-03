{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "bcc-skeleton"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "2022 The Blockchain Company.io LLC.";
      maintainer = "operations@tbco.io";
      author = "TBCO";
      homepage = "";
      url = "";
      synopsis = "Template project with reference CI setup";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = { depends = [ (hsPkgs.base) (hsPkgs.bcc-prelude) ]; };
      exes = {
        "bcc-skeleton" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bcc-prelude)
            (hsPkgs.bcc-skeleton)
            ];
          };
        };
      tests = {
        "unit" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bcc-prelude)
            (hsPkgs.bcc-skeleton)
            (hsPkgs.hspec)
            (hsPkgs.text)
            ];
          };
        };
      benchmarks = {
        "bcc-skeleton-bench" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bcc-prelude)
            (hsPkgs.criterion)
            (hsPkgs.bcc-skeleton)
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.././.; }
