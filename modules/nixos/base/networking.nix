{
  flake.modules.nixos.base = {
    pkgs,
    config,
    lib,
    ...
  }: {
    # enable networking
    age.secrets."aalto.8021x" = {
      rekeyFile = ../../../secrets/aalto.8021x.age;
      path = "/var/lib/iwd/aalto.8021x";
      mode = "600";
      owner = "root";
      group = "root";
    };
    age.secrets."eduroam.8021x" = {
      rekeyFile = ../../../secrets/eduroam.8021x.age;
      path = "/var/lib/iwd/eduroam.8021x";
      mode = "600";
      owner = "root";
      group = "root";
      generator.dependencies.token = config.age.secrets."aalto.8021x";
      generator.script = {
        decrypt,
        deps,
        ...
      }: ''
        ${decrypt} ${lib.escapeShellArg deps.token.file}
      '';
    };
    networking = {
      networkmanager = {
        enable = true;
        # aalto cisco anyconnect VPN
        plugins = with pkgs; [networkmanager-openconnect];
        wifi.backend = "iwd";
      };

      wireless.iwd.settings = {
        General.AddressRandomization = "network";
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
