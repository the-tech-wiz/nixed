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
      wireless.iwd.settings = {
        General.AddressRandomization = "network";
      };
      # KDE Connect whitelist
      firewall = rec {
        allowedTCPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
        ];
        allowedUDPPortRanges = allowedTCPPortRanges;
      };

      networkmanager = {
        enable = true;
        # aalto cisco anyconnect VPN
        plugins = with pkgs; [networkmanager-openconnect];
        wifi.backend = "iwd";

        ## NTP timeserver workaround from wiki.nixos.org
        # To use, put this in your configuration, switch to it, and restart NM:
        # $ sudo systemctl restart NetworkManager.service
        # To check if it works, you can do `sudo systemctl status systemd-timesyncd.service`
        # (it may take a bit of time to pick the right NTP as it may try the
        # other NTP firsts)
        dispatcherScripts = [
          {
            # https://wiki.archlinux.org/title/NetworkManager#Dynamically_set_NTP_servers_received_via_DHCP_with_systemd-timesyncd
            # You can debug with sudo journalctl -u NetworkManager-dispatcher -e
            # make sure to restart NM as described above
            source = pkgs.writeText "10-update-timesyncd" ''
              [ -z "$CONNECTION_UUID" ] && exit 0
              INTERFACE="$1"
              ACTION="$2"
              case $ACTION in
              up | dhcp4-change | dhcp6-change)
                  systemctl restart systemd-timesyncd.service
                  if [ -n "$DHCP4_NTP_SERVERS" ]; then
                    echo "Will add the ntp server $DHCP4_NTP_SERVERS"
                  else
                    echo "No DHCP4 NTP available."
                    exit 0
                  fi
                  mkdir -p /etc/systemd/timesyncd.conf.d
                  # <<-EOF must really use tabs to keep indentation correct… and tabs are often converted to space in wiki
                  # so I don't want to risk strange issues with indentation
                  echo "[Time]" > "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
                  echo "NTP=$DHCP4_NTP_SERVERS" >> "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
                  systemctl restart systemd-timesyncd.service
                  ;;
              down)
                  rm -f "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
                  systemctl restart systemd-timesyncd.service
                  ;;
              esac
              echo 'Done!'
            '';
          }
        ];
      };
    };
  };
}
