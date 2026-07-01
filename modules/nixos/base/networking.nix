{
  flake.modules.nixos.base = {
    # enable networking
    networking.networkmanager.enable = true;

    # kde connect port forwarding
    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
