{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "bcc-prelude"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2022 TBCO";
      maintainer = "operations@tbco.io";
      author = "TBCO";
      homepage = "";
      url = "";
      synopsis = "A Prelude replacement for the Bcc project";
      description = "A Prelude replacement for the Bcc project";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.aeson)
          (hsPkgs.array)
          (hsPkgs.base16-bytestring)
          (hsPkgs.bytestring)
          (hsPkgs.canonical-json)
          (hsPkgs.cborg)
          (hsPkgs.containers)
          (hsPkgs.formatting)
          (hsPkgs.ghc-heap)
          (hsPkgs.ghc-prim)
          (hsPkgs.hashable)
          (hsPkgs.integer-gmp)
          (hsPkgs.mtl)
          (hsPkgs.nonempty-containers)
          (hsPkgs.protolude)
          (hsPkgs.tagged)
          (hsPkgs.text)
          (hsPkgs.time)
          (hsPkgs.vector)
          ];
        };
      tests = {
        "bcc-prelude-test" = {
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
            (hsPkgs.ghc-heap)
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
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/bcc-prelude";
      rev = "c1f053a9dbc2763ad2163281a356a2cf0f4d7858";
      sha256 = "0p2fylc8fp2p2g184czi9ma96pb5f5xml15cb9l1a3hqajjkg99c";
      });
    }
