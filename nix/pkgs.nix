############################################################################
# Builds Haskell packages with Haskell.nix
############################################################################

{ pkgs

# haskell.nix
, haskell

# Filtered sources of this project
, src

# Test dependencies of bcc-skeleton.
# Change these to what's required for your project.
, quibitous
, cowsay

# Customisations for cross-compiling
, tbco-extras ? {}
, tbco-module ? {}

}:

let
  # our packages
  stack-pkgs = import ./.stack.nix/default.nix;

  # Grab the compiler name from stack-to-nix output.
  compiler = (stack-pkgs.extras {}).compiler.nix-name;

  # This creates the Haskell package set.
  # https://the-blockchain-company.github.io/haskell.nix/user-guide/projects/
  pkgSet = haskell.mkStackPkgSet {
    inherit stack-pkgs;
    modules = [
      # Add source filtering to local packages
      {
        #packages.bcc-skeleton.src = src;
        # packages.another-package = src + /another-package;
      }

      # The tbco-module will supply us with the necessary
      # cross compilation plumbing to make Template Haskell
      # work when cross compiling.
      tbco-module
    ];

    pkg-def-extras = [
      # tbco-extras contains package overrides and patches per ghc version.
      tbco-extras.${compiler}
    ];
  };

in
  pkgSet.config.hsPkgs // { _config = pkgSet.config; }
