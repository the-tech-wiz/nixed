{
  # backup editors: vscode and vscodium
  flake.modules.homeManager.programs = {
    pkgs,
    lib,
    ...
  }: let
    args = {
      profiles.default = {
        extensions = with pkgs;
          (with vscode-extensions; [
            # -- GENERAL --
            mkhl.direnv
            jnoortheen.nix-ide
            usernamehw.errorlens
            # vscodevim.vim
            asvetliakov.vscode-neovim

            # -- LANGUAGES --
            # banacorn.agda-mode
            leanprover.lean4

            llvm-vs-code-extensions.vscode-clangd
            vadimcn.vscode-lldb

            myriad-dreamin.tinymist

            rust-lang.rust-analyzer
            fill-labs.dependi
            tamasfe.even-better-toml

            geequlim.godot-tools # For Godot GDScript support
            woberg.godot-dotnet-tools # For Godot C# support
            # ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            ms-dotnettools.vscode-dotnet-runtime
          ])
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "vscode-proverif";
              publisher = "ProVerif";
              version = "1.8.17";
              sha256 = "sha256-IGel2bVC7yqll824LGI9E1dkGK5hUDZI5EX9BsbGpxc=";
            }
          ];

        userSettings = {
          "editor.codeLens" = false;
          "editor.cursorBlinking" = "solid";
          "editor.formatOnSave" = true;
          "editor.inlayHints.enabled" = "offUnlessPressed";
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "editor.unicodeHighlight.ambiguousCharacters" = false;

          "files.autoSave" = "onFocusChange";
          "files.simpleDialog.enable" = true;
          "files.trimTrailingWhitespace" = true;
          "files.insertFinalNewline" = true;
          "explorer.confirmDelete" = false;

          "errorLens.replace" = [
            {
              # only keep the first line of diagnostics.
              matcher = "(.+)\\n";
              message = "$1";
            }
          ];

          "agdaMode.buffer.fontSize" = null;
          "agdaMode.connection.downloadPolicy" = "No, and don't ask again";
          "agdaMode.inputMethod.enabled" = false;
          "lean4.input.languages" = [
            "lean"
            "lean4"
            "agda"
          ];

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings" = {
            nixd.formatting.command = ["alejandra"];
          };

          # --- VIM ---
          "extensions.experimental.affinity" = {
            "asvetliakov.vscode-neovim" = 1;
          };
          "vim.normalModeKeyBindingsNonRecursive" = [
            # move between diagnostics.
            {
              before = ["[" "d"];
              commands = ["editor.action.marker.prevInFiles"];
              silent = true;
            }
            {
              before = ["]" "d"];
              commands = ["editor.action.marker.nextInFiles"];
              silent = true;
            }

            # show LSP hover.
            {
              before = ["K"];
              commands = ["editor.action.showHover"];
              silent = true;
            }
          ];
          "vim.visualModeKeyBindings" = [
            # indent and outdent lines.
            {
              before = [">"];
              commands = ["editor.action.indentLines"];
            }
            {
              before = ["<"];
              commands = ["editor.action.outdentLines"];
            }
          ];
          "vim.useSystemClipboard" = true;

          # --- NVIM ---
          "vscode-neovim.ctrlKeysForNormalMode" = [
            "a"
            "b"
            "c"
            "d"
            "f"
            "h"
            "i"
            "j"
            "l"
            "m"
            "o"
            "r"
            "t"
            "u"
            "v"
            "v"
            "w"
            "x"
            "y"
            "z"
            "/"
            "]"
            "right"
            "left"
            "up"
            "down"
            "backspace"
            "delete"
          ];

          "vscode-neovim." = [
            "a"
            "b"
            "c"
            "d"
            "f"
            "h"
            "i"
            "j"
            "l"
            "m"
            "o"
            "r"
            "t"
            "u"
            "v"
            "w"
            "x"
            "y"
            "z"
            "/"
            "]"
            "right"
            "left"
            "up"
            "down"
            "backspace"
            "delete"
          ];

          "lldb.suppressUpdateNotifications" = true;

          "proverif.proverifPath" = "proverif";

          # --- GODOT C# ---
          "dotnetAcquisitionExtension.existingDotnetPath" = [
            {
              "extensionId" = "ms-dotnettools.csharp";
              "path" = "${pkgs.dotnet-sdk_9}/bin";
            }
            # {
            #   "extensionId" = "ms-dotnettools.csdevkit";
            #   "path" = "${pkgs.dotnet-sdk_9}/bin";
            # }
            {
              "extensionId" = "woberg.godot-dotnet-tools";
              "path" = "${pkgs.dotnet-sdk_8}/bin"; # Godot-Mono uses DotNet8 version.
            }
          ];
          "godotTools.lsp.serverPort" = 6005; # port should match your Godot configuration
          "godotTools.editorPath.godot4" = "godot-mono";
        };
      };
    };
  in {
    programs.vscodium = {enable = true;} // args;

    # the inferior one I keep around for random incompatibilities
    programs.vscode =
      {
        enable = true;
        package = lib.lowPrio pkgs.vscode;
      }
      // args;
  };
}
