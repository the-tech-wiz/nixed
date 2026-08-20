{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # brc modding
      r2modman
      # terraria & sts2 modding
      dotnet-sdk_8
    ];
    environment.sessionVariables = {DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet/";};
  };
}
