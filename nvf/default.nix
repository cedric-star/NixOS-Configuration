{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    
    settings.vim = {
      # Leader muss als separates Attribut gesetzt werden
      globals.mapleader = " ";
      
      # Basis-Settings
      options = {
        number = true;
        relativenumber = true;
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };

      # Statusline & Plugins
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      lsp.enable = true;

      # Sprachen
      languages = {
        enableTreesitter = true;
        nix.enable = true;
        sql.enable = true;
        clang.enable = true;
        ts.enable = true;
        python.enable = true;
        bash.enable = true;
        css.enable = true;
        typst.enable = true;
        yaml.enable = true;
        java.enable = true;
      };

      # Alle Keymaps hier
      keymaps = [
        # Kern-Navigation (bleibt)
        { key = "j"; mode = ["n" "v" "o"]; action = "h"; }
        { key = "k"; mode = ["n" "v" "o"]; action = "j"; }
        { key = "l"; mode = ["n" "v" "o"]; action = "k"; }
        { key = "ö"; mode = ["n" "v" "o"]; action = "l"; }

        # Escape (bleibt)
        { key = "nn"; mode = "i"; action = "<Esc>"; }

        # === NEU: Modifier auf Home-Row (Colemak-optimiert) ===
        # h/n/e/i sind auf Colemak-Home-Row und frei geworden!

        # h = "here" → Insert (statt i)
        { key = "h"; mode = "n"; action = "i"; }

        # n = "next"/"new" → Append (statt a) 
        { key = "n"; mode = "n"; action = "a"; }
        { key = "N"; mode = "n"; action = "A"; }

        # e = "end" / "enter" → Open line (statt o)
        { key = "e"; mode = "n"; action = "o"; }
        { key = "E"; mode = "n"; action = "O"; }

        # i = "in" → Inside text-objects (statt v für visual)
        { key = "i"; mode = "n"; action = "v"; }
        { key = "I"; mode = "n"; action = "V"; }

        # === Vim-Grammatik reparieren ===
        # y/d/p bleiben yank/delete/put! Stattdessen:

        # c = change (Vim-Standard), aber du willst copy
        # Lösung: Leader+c für copy, oder:
        { key = "c"; mode = ["n" "v"]; action = "y"; }  # Deine Wahl, aber...
        # Besser: behalte c=change, nutze y für yank, und:
        { key = "<leader>y"; mode = ["n" "v"]; action = "\"+y"; }  # System-clipboard
        { key = "<leader>p"; mode = ["n" "v"]; action = "\"+p"; }  # System-paste

        # x = cut (dein Layout), aber Vim: x = delete char
        # Kompromiss: X (Shift+x) für cut?
        { key = "x"; mode = ["n" "v"]; action = "d"; }  # Deine Wahl
        { key = "X"; mode = ["n" "v"]; action = "\"+d"; }  # Cut to system

        # v = paste bei dir, aber v = visual (ESSENZIELL)
        # Lösung: behalte v=visual, nutze p für paste:
        # (p ist bei dir frei, da du P→<Nop> gemacht hast)
        { key = "p"; mode = ["n" "v"]; action = "p"; }  # Standard wiederherstellen
        { key = "P"; mode = ["n" "v"]; action = "P"; }
        # Oder: Leader+v für paste?
      ];
    };
  };
}