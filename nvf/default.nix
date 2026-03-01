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
        # ==========================================
        # NAVIGATION (Colemak/Custom Layout)
        # ==========================================
        { key = "j"; mode = ["n" "v" "o"]; action = "h"; noremap = true; }
        { key = "ö"; mode = ["n" "v" "o"]; action = "l"; noremap = true; }
        { key = "k"; mode = ["n" "v" "o"]; action = "j"; noremap = true; }
        { key = "l"; mode = ["n" "v" "o"]; action = "k"; noremap = true; }

        # ==========================================
        # MODUS-WECHSEL
        # ==========================================
        { key = "nn"; mode = "i"; action = "<Esc>"; noremap = true; }
        { key = "ii"; mode = "n"; action = "i"; noremap = true; }
        { key = "m"; mode = "n"; action = "v"; noremap = true; }

        # ==========================================
        # CLIPBOARD-OPERATIONEN
        # ==========================================
        { key = "c"; mode = ["n" "v"]; action = "y"; noremap = true; }    # Yank
        { key = "x"; mode = ["n" "v"]; action = "d"; noremap = true; }    # Delete
        { key = "v"; mode = ["n" "v"]; action = "p"; noremap = true; }    # Paste
        { key = "V"; mode = ["n" "v"]; action = "P"; noremap = true; }    # Paste before

        # ==========================================
        # UNDO/REDO
        # ==========================================
        { key = "<C-z>"; mode = "n"; action = "u"; noremap = true; }
        { key = "<C-z>"; mode = "i"; action = "<C-o>u"; noremap = true; }
        { key = "<C-y>"; mode = "n"; action = "<C-r>"; noremap = true; }
        { key = "<C-y>"; mode = "i"; action = "<C-o><C-r>"; noremap = true; }

        # ==========================================
        # NORMAL MODE - DEAKTIVIERTE TASTEN
        # ==========================================
        { key = "h"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = ";"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = ","; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "w"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "b"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "e"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "$"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "0"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "^"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "G"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "gg"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "s"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "/"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "?"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "n"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "N"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "*"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "#"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "y"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "d"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "p"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "P"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "a"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "A"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "i"; mode = "n"; action = "<Nop>"; noremap = true; }  # Achtung: "ii" ist oben definiert!
        { key = "I"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "o"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "O"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "u"; mode = "n"; action = "<Nop>"; noremap = true; }  # Achtung: <C-z> ist oben definiert!
        { key = "<C-r>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "r"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "R"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-d>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-u>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-f>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-b>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-o>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<C-i>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F1>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F2>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F3>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F4>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F5>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F6>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F7>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F8>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F9>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F10>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F11>"; mode = "n"; action = "<Nop>"; noremap = true; }
        { key = "<F12>"; mode = "n"; action = "<Nop>"; noremap = true; }

        # ==========================================
        # VISUAL MODE - DEAKTIVIERTE TASTEN
        # ==========================================
        { key = "y"; mode = "v"; action = "<Nop>"; noremap = true; }
        { key = "d"; mode = "v"; action = "<Nop>"; noremap = true; }
        { key = "p"; mode = "v"; action = "<Nop>"; noremap = true; }
        { key = "P"; mode = "v"; action = "<Nop>"; noremap = true; }
        { key = "<"; mode = "v"; action = "<Nop>"; noremap = true; }
        { key = ">"; mode = "v"; action = "<Nop>"; noremap = true; }

        # ==========================================
        # INSERT MODE - DEAKTIVIERTE TASTEN
        # ==========================================
        { key = "<C-c>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<C-[>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<Up>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<Down>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<Left>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<Right>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<Home>"; mode = "i"; action = "<Nop>"; noremap = true; }
        { key = "<End>"; mode = "i"; action = "<Nop>"; noremap = true; }

        # ==========================================
        # OPERATOR-PENDING MODE - DEAKTIVIERTE TASTEN
        # ==========================================
        { key = "aw"; mode = "o"; action = "<Nop>"; noremap = true; }
        { key = "iw"; mode = "o"; action = "<Nop>"; noremap = true; }
        { key = "a\""; mode = "o"; action = "<Nop>"; noremap = true; }
        { key = "i\""; mode = "o"; action = "<Nop>"; noremap = true; }
        { key = "a'"; mode = "o"; action = "<Nop>"; noremap = true; }
        { key = "i'"; mode = "o"; action = "<Nop>"; noremap = true; }

        # ==========================================
        # COMMAND MODE - DEAKTIVIERTE TASTEN
        # ==========================================
        { key = "<C-a>"; mode = "c"; action = "<Nop>"; noremap = true; }
        { key = "<C-e>"; mode = "c"; action = "<Nop>"; noremap = true; }
        { key = "<C-f>"; mode = "c"; action = "<Nop>"; noremap = true; }
        { key = "<C-b>"; mode = "c"; action = "<Nop>"; noremap = true; }
      ];
    };
  };
}