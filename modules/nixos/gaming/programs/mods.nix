{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    # brc modding
    environment.systemPackages = with pkgs; [r2modman dotnet-sdk_8];
    environment.sessionVariables = {DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet/";};
  };
}
