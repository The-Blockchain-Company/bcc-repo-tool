{ pkgs ? import <nixpkgs> {} }:

with pkgs.lib;

{
  # TODO: Replace this with a function that identifies packages from your
  # project.
  # As an example, this matches packages called "bcc-skeleton*" and the package
  # called "another-package".
  # fixme: automate this in nix-tools/Haskell.nix.
  isBcc-skeleton = package:
    (hasPrefix "bcc-skeleton" package.identifier.name) ||
    (elem package.identifier.name [ "another-package" ]);

  # fixme: upstream to tbco-nix
  collectComponents = group: packageSel: haskellPackages:
    (mapAttrs (_: package: package.components.${group} // { recurseForDerivations = true; })
     (filterAttrs (name: package: (package.isHaskell or false) && packageSel package) haskellPackages))
    // { recurseForDerivations = true; };
}
