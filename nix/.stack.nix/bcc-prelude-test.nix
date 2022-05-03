{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "bcc-prelude-test"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2018 TBCO";
      maintainer = "operations@tbco.io";
      author = "TBCO";
      homepage = "";
      url = "";
      synopsis = "Utility types and functions for testing Bcc";
      description = "Utility types and functions for testing Bcc";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.aeson)
          (hsPkgs.aeson-pretty)
          (hsPkgs.attoparsec)
          (hsPkgs.base16-bytestring)
          (hsPkgs.bytestring)
          (hsPkgs.canonical-json)
          (hsPkgs.bcc-prelude)
          (hsPkgs.containers)
          (hsPkgs.cryptonite)
          (hsPkgs.formatting)
          (hsPkgs.hedgehog)
          (hsPkgs.hspec)
          (hsPkgs.pretty-show)
          (hsPkgs.QuickCheck)
          (hsPkgs.quickcheck-instances)
          (hsPkgs.text)
          (hsPkgs.template-haskell)
          (hsPkgs.time)
          ];
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/bcc-prelude";
      rev = "c1f053a9dbc2763ad2163281a356a2cf0f4d7858";
      sha256 = "2ca537a554180e15685aac045a7b71655d93544df13382c213575c8718f54e5c";
      });
    postUnpack = "sourceRoot+=/test; echo source root reset to \$sourceRoot";
    }
