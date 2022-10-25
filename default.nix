############################################################################
# bcc-repo-tool Nix build
#
# fixme: document top-level attributes and how to build them
#
############################################################################

{ system ? builtins.currentSystem
, crossSystem ? null
, config ? {}
# Import TBCO common nix lib
, tbcoLib ? import ./nix/tbco-common.nix { inherit system crossSystem config; }
# Use nixpkgs pin from tbcoLib
, pkgs ? tbcoLib.pkgs
}:

let
  haskell = pkgs.callPackage tbcoLib.nix-tools.haskell {};
  src = tbcoLib.cleanSourceHaskell ./.;
  util = pkgs.callPackage ./nix/util.nix {};

  # Example of using a package from tbco-nix
  # TODO: Declare packages required by the build.
  inherit (tbcoLib.rust-packages.pkgs) quibitous;

  # Import the Haskell package set.
  haskellPackages = import ./nix/pkgs.nix {
    inherit pkgs haskell src;
    # Pass in any extra programs necessary for the build as function arguments.
    # TODO: Declare packages required by the build.
    # quibitous and cowsay are just examples and should be removed for your
    # project, unless needed.
    inherit bcc-rosetta;
    inherit bcc-db-sync;
    inherit bcc-ledger-specs; 
    inherit bcc-prelude;
    inherit bcc-base;
    inherit nix-tools;
    inherit quibitous;
    inherit (pkgs) cowsay;
    # Provide cross-compiling secret sauce
    inherit (tbcoLib.nix-tools) tbco-extras tbco-module;
  };

in {
  inherit pkgs tbcoLib src haskellPackages;
  inherit (haskellPackages.bcc-repo-tool.identifier) version;

  # Grab the executable component of our package.
  inherit (haskellPackages.bcc-repo-tool.components.exes) bcc-repo-tool;

  tests = util.collectComponents "tests" util.isBcc-skeleton haskellPackages;
  benchmarks = util.collectComponents "benchmarks" util.isBcc-skeleton haskellPackages;

  # This provides a development environment that can be used with nix-shell or
  # lorri. See https://the-blockchain-company.github.io/haskell.nix/user-guide/development/
  shell = haskellPackages.shellFor {
    name = "bcc-repo-tool-shell";
    # TODO: List all local packages in the project.
    packages = ps: with ps; [
      bcc-repo-tool
    ];
    # These programs will be available inside the nix-shell.
    buildInputs =
      with pkgs.haskellPackages; [ hlint stylish-haskell weeder ghcid lentil ]
      # TODO: Add your own packages to the shell.
      ++ [ quibitous ];
  };

  # Example of a linting script used by Buildkite.
  checks.lint-fuzz = pkgs.callPackage ./nix/check-lint-fuzz.nix {};

  # Attrset of PDF builds of LaTeX documentation.
  docs = pkgs.callPackage ./docs/default.nix {};
}
