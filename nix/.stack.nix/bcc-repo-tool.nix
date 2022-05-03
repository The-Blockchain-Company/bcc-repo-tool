{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "bcc-repo-tool"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "(c) 2022 TBCO";
      maintainer = "operations@tbco.io";
      author = "TBCO Engineering Team";
      homepage = "";
      url = "";
      synopsis = "A tool to update the dependencies in Bcc related git checkouts.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.ansi-terminal)
          (hsPkgs.containers)
          (hsPkgs.directory)
          (hsPkgs.filepath)
          (hsPkgs.nix-archive)
          (hsPkgs.process)
          (hsPkgs.text)
          ];
        };
      exes = {
        "bcc-repo-tool" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bcc-repo-tool)
            (hsPkgs.directory)
            (hsPkgs.optparse-applicative)
            (hsPkgs.text)
            ];
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bcc-repo-tool)
            (hsPkgs.hedgehog)
            (hsPkgs.text)
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.././.; }
