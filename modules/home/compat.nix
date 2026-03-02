# compatibility shim for Lix.
#
# taken from
# <https://github.com/nix-community/home-manager/issues/8786#issuecomment-3964961582>.
{
  inputs,
  lib,
  ...
}: {
  flake.modules.homeManager.compat = {config, ...}: let
    inherit (inputs.home-manager.lib) hm;
    inherit (config.home) path profileDirectory;
  in {
    home.activation.installPackages =
      lib.mkForce
      (hm.dag.entryAfter ["writeBoundary"] ''
        nixProfileRemove home-manager-path
        if [[ -e ${profileDirectory}/manifest.json ]]; then
          run nix profile install ${path}
        else
          run nix-env -i ${path}
        fi
      '');
  };
}
