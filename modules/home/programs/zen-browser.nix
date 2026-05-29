{
  self,
  inputs,
  lib,
  ...
}: {
  flake.modules.homeManager.programs = {config, ...}: let
    cfg = config.programs.zen-browser;
  in {
    imports = with inputs; [
      zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;

          Cryptomining = true;
          EmailTracking = true;
          Fingerprinting = true;
        };

        # firefox sync does the job ty
        # ExtensionSettings = let
        #   mkExtensions = lib.mapAttrs (_: id: {
        #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
        #     installation_mode = "force_installed";
        #   });
        # in
        #   mkExtensions {
        #     "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
        #     "{569456be-2850-4f7e-b669-71e55140ee0a}" = "amp2html";
        #     "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
        #     "addon@darkreader.org" = "darkreader";
        #     "gdpr@cavi.au.dk" = "consent-o-matic";
        #     "jid1-MnnxcxisBPnSXQ@jetpack" = "privacy-badger17";
        #     "sponsorBlocker@ajay.app" = "sponsorblock";
        #     "uBlock0@raymondhill.net" = "ublock-origin";
        #   };

        GenerativeAI = {
          Enabled = false;
          Locked = true;

          Chatbot = false;
          LinkPreviews = false;
          TabGroups = false;
        };

        # Firefox preferences.
        #
        # doesn't work for Zen-specific options, see
        # <https://github.com/0xc000022070/zen-browser-flake/issues/59#issuecomment-2964607780>
        Preferences = let
          mkPreferences = lib.mapAttrs (_: value: {
            Value = value;
            Status = "locked";
          });
        in
          mkPreferences {
            # don't show warnings when entering `about:config`.
            "browser.aboutConfig.showWarning" = false;

            # download files into XDG user dirs.
            "browser.download.dir" = config.xdg.userDirs.download;
            "browser.download.folderList" = 2;

            # block all AI features.
            "browser.ai.control.default" = "blocked";
            "browser.ml.enable" = false;
            "extensions.ml.enabled" = false;

            # enable HTTPS-only mode.
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_send_http_background_request" = false;

            # don't show speech synthesizer errors.
            "media.webspeech.synth.dont_notify_on_error" = true;
          };
      };

      # default profile settings.
      profiles.default = {
        settings = {
          # enable compact mode.
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.compact.show-sidebar-and-toolbar-on-hover" = false;
        };

        keyboardShortcuts = [
          {
            id = "zen-toggle-sidebar";
            key = "s";
            modifiers = {
              alt = true;
            };
          }
        ];

        search = {
          force = true;
          default = "kagi";

          engines = {
            kagi = {
              name = "Kagi";
              definedAliases = ["@kagi"];
              urls = [
                {
                  template = "https://kagi.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };
            duckduckgo = {
              name = "DuckDuckGo";
              definedAliases = ["@d"];
              urls = [
                {
                  template = "noai.duckduckgo.com";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };
          };
        };
      };
    };

    xdg.mimeApps.defaultApplications =
      self.lib.genAttrsK
      cfg.finalPackage.desktopItem.name
      [
        "application/pdf"
      ];
  };
}
