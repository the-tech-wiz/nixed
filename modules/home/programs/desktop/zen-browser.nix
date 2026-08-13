{
  self,
  inputs,
  lib,
  ...
}: {
  flake.modules.homeManager.programs = {
    config,
    pkgs,
    ...
  }: {
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

            # disable extension signing
            "xpinstall.signatures.required" = false;
          };
      };

      # default profile settings.
      # (extensions, bookmarks just use sync)
      profiles.default = {
        settings = {
          # toolbar
          "zen.view.use-single-toolbar" = true;
          # compact mode
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.compact.show-sidebar-and-toolbar-on-hover" = false;
          "zen.view.compact.toolbar-flash-popup" = true;

          "zen.tabs.vertical.right-side" = true;

          "zen.workspaces.force-container-workspace" = true;
          "zen.workspaces.separate-essentials" = false;
          # suggestions
          "browser.search.suggest.enabled" = true;
          "browser.search.suggest.enabled.private" = true;
          "browser.urlbar.showSearchSuggestionsFirst" = true;
        };

        # prevent breaking changes
        keyboardShortcutsVersion = 19;

        keyboardShortcuts = [
          {
            id = "zen-compact-mode-show-sidebar";
            key = "s";
            modifiers = {
              alt = true;
            };
          }
        ];

        search = {
          force = true;
          default = "duckduckgonoai";

          engines = {
            duckduckgonoai = {
              name = "DuckDuckGo No AI";
              definedAliases = ["d"];
              urls = [
                {
                  template = "https://noai.duckduckgo.com/";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };
            home-manager = {
              name = "Home Manager options";
              definedAliases = ["hm"];
              urls = [
                {
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            nixpkgs = {
              name = "nixpkgs";
              definedAliases = ["pkg"];
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            nixos-wiki = {
              name = "NixOS Wiki";
              definedAliases = ["nixwiki"];
              urls = [
                {
                  template = "https://nixos.wiki/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            noogle = {
              name = "Noogle";
              definedAliases = ["noo"];
              urls = [
                {
                  template = "https://noogle.dev/q/";
                  params = [
                    {
                      name = "term";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
            mynixos = {
              name = "My NixOS";
              definedAliases = ["mnix"];
              urls = [
                {
                  template = "https://mynixos.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            };
          };
        };

        # Find mod UUIDs at: https://zen-browser.app/mods
        mods = [
          "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
          "5bb07b6e-c89f-4f4a-a0ed-e483cc535594" # Custom MenuButton
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "72f8f48d-86b9-4487-acea-eb4977b18f21" # Better CtrlTab Panel
          "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
        ];
        # spacesForce = true; # Delete spaces not declared here
        # spaces = {
        #   "Gaming" = {
        #       id =
        #     }
        #   "Personal" = {
        #     id = "c6de089c-410d-4206-961d-ab11f988d40a";
        #     position = 1000;
        #     icon = "🏠";
        #   };
        #   "Work" = {
        #     id = "cdd10fab-4fc5-494b-9041-325e5759195b";
        #     position = 2000;
        #     icon = "💼";
        #     theme = {
        #       type = "gradient";
        #       colors = [
        #         {
        #           red = 100;
        #           green = 150;
        #           blue = 200;
        #           algorithm = "floating";
        #           type = "explicit-lightness";
        #           lightness = 50;
        #         }
        #       ];
        #       opacity = 0.8;
        #       texture = 0.5;
        #     };
        #   };
        #   "Shopping" = {
        #     id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
        #     position = 3000;
        #     icon = "💸";
        #   };
        # };
      };
    };

    xdg.mimeApps.defaultApplications =
      self.lib.genAttrsK
      config.programs.zen-browser.finalPackage.desktopItem.name
      [
        "application/pdf"
      ];
  };
}
