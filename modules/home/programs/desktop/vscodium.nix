{
  # backup editor
  flake.modules.homeManager.programs = {pkgs, ...}: {
    programs.vscodium = {
      enable = true;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # banacorn.agda-mode
          fill-labs.dependi
          jnoortheen.nix-ide
          leanprover.lean4
          llvm-vs-code-extensions.vscode-clangd
          mkhl.direnv
          myriad-dreamin.tinymist
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          usernamehw.errorlens
          vadimcn.vscode-lldb
          # vscodevim.vim
          asvetliakov.vscode-neovim

          geequlim.godot-tools # For Godot GDScript support
          woberg.godot-dotnet-tools # For Godot C# support
          # ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-dotnettools.vscode-dotnet-runtime
        ];

        userSettings = {
          "editor.codeLens" = false;
          "editor.cursorBlinking" = "solid";
          "editor.formatOnSave" = true;
          "editor.inlayHints.enabled" = "offUnlessPressed";
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "editor.unicodeHighlight.ambiguousCharacters" = false;
          "window.zoomLevel" = 3;

          "files.autoSave" = "onFocusChange";
          "files.simpleDialog.enable" = true;
          "files.trimTrailingWhitespace" = true;

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
          "lldb.suppressUpdateNotifications" = true;
          "explorer.confirmDelete" = false;

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

    home.packages = with pkgs; [
      dotnetCorePackages.dotnet_9.sdk # For Godot-Mono VSCode-Extension CSharp
    ];
  };
}
