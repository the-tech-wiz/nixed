{
  flake.modules.nixos.base = {pkgs, ...}: {
    # enable networking
    networking = {
      networkmanager = {
        enable = true;
        # aalto cisco anyconnect VPN
        plugins = with pkgs; [networkmanager-openconnect];
      };
      # KDE Connect
      firewall = rec {
        allowedTCPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
        ];
        allowedUDPPortRanges = allowedTCPPortRanges;
      };
    };
  };
}
