{
  # backup editors: vscode and vscodium
  flake.modules.homeManager.programs = {
    pkgs,
    lib,
    ...
  }: let
    keybindings = [
      {
        key = "ctrl+f10";
        command = "C_Cpp.BuildAndRunFile";
      }
      {
        key = "ctrl+n";
        command = "-workbench.action.files.newUntitledFile";
      }
      {
        key = "ctrl+n";
        command = "explorer.newFile";
      }
      {
        key = "ctrl+w";
        command = "-workbench.action.terminal.killEditor";
        when = "terminalEditorFocus && terminalFocus && terminalHasBeenCreated && resourceScheme == 'vscode-terminal' || terminalEditorFocus && terminalFocus && terminalProcessSupported && resourceScheme == 'vscode-terminal'";
      }
      {
        key = "ctrl+w";
        command = "-workbench.action.closeActiveEditor";
      }
      {
        key = "ctrl+w";
        command = "-workbench.action.closeGroup";
        when = "activeEditorGroupEmpty && multipleEditorGroups";
      }
      {
        key = "ctrl+w";
        command = "editor.debug.action.selectionToWatch";
      }
      {
        key = "ctrl+d";
        command = "-editor.action.addSelectionToNextFindMatch";
        when = "editorFocus";
      }
      {
        key = "ctrl+d";
        command = "explorer.newFolder";
      }
      {
        key = "ctrl+m";
        command = "-editor.action.toggleTabFocusMode";
      }
      {
        key = "ctrl+shift+,";
        command = "-workbench.action.terminal.configureSuggestSettings";
        when = "terminalFocus && terminalHasBeenCreated && terminalIsOpen && terminalSuggestWidgetVisible || terminalFocus && terminalIsOpen && terminalProcessSupported && terminalSuggestWidgetVisible";
      }
      {
        key = "ctrl+shift+,";
        command = "-editor.action.inPlaceReplace.up";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+shift+,";
        command = "workbench.action.openSettingsJson";
      }
      {
        key = "ctrl+shift+alt+up";
        command = "editor.action.insertCursorAbove";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+shift+up";
        command = "-editor.action.insertCursorAbove";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+shift+alt+up";
        command = "-editor.action.copyLinesUpAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+shift+up";
        command = "rust-analyzer.moveItemUp";
      }
      {
        key = "ctrl+shift+alt+down";
        command = "editor.action.insertCursorBelow";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+shift+down";
        command = "-editor.action.insertCursorBelow";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+shift+alt+down";
        command = "-editor.action.copyLinesDownAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+shift+down";
        command = "rust-analyzer.moveItemDown";
      }
      {
        key = "ctrl+o ctrl+r";
        command = "workbench.action.openRecent";
      }
      {
        key = "ctrl+r";
        command = "-workbench.action.openRecent";
      }
      {
        key = "ctrl+shift+alt+r";
        command = "workbench.action.reloadWindow";
        when = "editorFocus";
      }
      {
        key = "ctrl+r";
        command = "-workbench.action.reloadWindow";
        when = "isDevelopment";
      }
      {
        key = "ctrl+shift+alt+v";
        command = "toggleVim";
      }
      {
        key = "alt+k";
        command = "-keybindings.editor.recordSearchKeys";
        when = "inKeybindings && inKeybindingsSearch";
      }
      {
        key = "alt+k";
        command = "-editor.action.accessibilityHelpConfigureKeybindings";
        when = "accessibilityHelpIsShown && accessibleViewHasUnassignedKeybindings";
      }
      {
        key = "alt+k";
        command = "editor.action.moveLinesUpAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "alt+up";
        command = "-editor.action.moveLinesUpAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "alt+j";
        command = "editor.action.moveLinesDownAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "alt+down";
        command = "-editor.action.moveLinesDownAction";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+k ctrl+k";
        command = "-editor.action.defineKeybinding";
        when = "resource == 'vscode-userdata:/home/techwiz/.config/VSCodium/User/keybindings.json'";
      }
      {
        key = "ctrl+k ctrl+k";
        command = "-editor.action.selectFromAnchorToCursor";
        when = "editorTextFocus && selectionAnchorSet";
      }
      {
        key = "ctrl+k ctrl+k";
        command = "workbench.action.navigateUp";
        when = "!terminalFocus && neovim.mode != 'cmdline'";
      }
      {
        key = "ctrl+w k";
        command = "-workbench.action.navigateUp";
        when = "!editorTextFocus && !terminalFocus && neovim.mode != 'cmdline'";
      }
    ];

    args = {
      profiles.default = {
        inherit keybindings;
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
