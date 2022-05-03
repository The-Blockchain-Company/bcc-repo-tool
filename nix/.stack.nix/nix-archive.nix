{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.4";
      identifier = { name = "nix-archive"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "(c) 2022 TBCO";
      maintainer = "operations@tbco.io";
      author = "TBCO Engineering Team";
      homepage = "";
      url = "";
      synopsis = "A library and executable for manipulating Nix Archive files";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.attoparsec)
          (hsPkgs.base16-bytestring)
          (hsPkgs.base32-z-bytestring)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.containers)
          (hsPkgs.cryptonite)
          (hsPkgs.directory)
          (hsPkgs.filepath)
          (hsPkgs.memory)
          (hsPkgs.pretty-show)
          (hsPkgs.process-extras)
          (hsPkgs.quiet)
          (hsPkgs.text)
          (hsPkgs.transformers)
          (hsPkgs.transformers-except)
          ];
        };
      exes = {
        "nar" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.filepath)
            (hsPkgs.nix-archive)
            (hsPkgs.optparse-applicative)
            (hsPkgs.text)
            ];
          };
        };
      };
    } // { #TODO
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/the-blockchain-company/nix-archive";
      rev = "c21950a2a7bbf859236e04b1d0a4e6163c918c28";
      sha256 = "b54ea61851d78fde902925e063ebbd2427d9d9eee217714bcac7b1e534cb5caf";
      });
    }
