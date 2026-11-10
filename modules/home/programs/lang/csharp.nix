{
  flake.modules.homeManager.programs = {pkgs, ...}: {
    home.packages = with pkgs; [
      omnisharp-roslyn
      dotnetCorePackages.dotnet_9.sdk
    ];
  };
}
