{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "bcc-binary"; version = "1.5.0"; };
      license = "MIT";
      copyright = "2019 TBCO";
      maintainer = "operations@tbco.io";
      author = "TBCO";
      homepage = "";
      url = "";
      synopsis = "Binary serialization for Bcc";
      description = "This package includes the binary serialization format for Bcc";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.aeson)
          (hsPkgs.bytestring)
          (hsPkgs.bcc-prelude)
          (hsPkgs.cborg)
          (hsPkgs.containers)
          (hsPkgs.digest)
          (hsPkgs.formatting)
          (hsPkgs.recursion-schemes)
          (hsPkgs.safe-exceptions)
          (hsPkgs.tagged)
          (hsPkgs.text)
          (hsPkgs.time)
          (hsPkgs.vector)
          ];
        };
      tests = {
        "test" = {
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
            (hsPkgs.tagged)
            (hsPkgs.text)
            (hsPkgs.vector)
            ];
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/bcc-base";
      rev = "f6b3923ac0fb162098050f67dcbc31f6d721b22d";
      sha256 = "cad4e2a98a245caaf81a13a352c0a8e45d398843f49632ec77e582c04ff5286d";
      });
    postUnpack = "sourceRoot+=/binary; echo source root reset to \$sourceRoot";
    }
