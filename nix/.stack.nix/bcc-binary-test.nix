{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "bcc-binary-test"; version = "1.3.0"; };
      license = "MIT";
      copyright = "2022 TBCO
      maintainer = "operations@tbco.io";
      author = "TBCO";
      homepage = "";
      url = "";
      synopsis = "Test helpers from bcc-binary exposed to other packages";
      description = "Test helpers from bcc-binary exposed to other packages";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.bcc-binary)
          (hsPkgs.bcc-prelude)
          (hsPkgs.bcc-prelude-test)
          (hsPkgs.cborg)
          (hsPkgs.containers)
          (hsPkgs.formatting)
          (hsPkgs.hedgehog)
          (hsPkgs.hspec)
          (hsPkgs.pretty-show)
          (hsPkgs.QuickCheck)
          (hsPkgs.quickcheck-instances)
          (hsPkgs.text)
          (hsPkgs.vector)
          ];
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/bcc-base";
      rev = "f6b3923ac0fb162098050f67dcbc31f6d721b22d";
      sha256 = "0v98ym7w10p5fzn355pl8f43jpg4m30558qk3bwalp14ialy5m6a";
      });
    postUnpack = "sourceRoot+=/binary/test; echo source root reset to \$sourceRoot";
    }
