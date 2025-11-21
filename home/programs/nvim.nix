{ config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.prolog

            # LSP Support
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      cmp_luasnip
    ];

    extraConfig = ''
      set number
      set relativenumber
      set tabstop=2

      nnoremap j h
      vnoremap j h
      onoremap j h

      nnoremap ö l
      vnoremap ö e  
      onoremap ö l

      nnoremap k j
      vnoremap k j
      onoremap k j

      nnoremap l k
      vnoremap l k
      onoremap l k

" modi wechseln
      inoremap nn <Esc>
      nnoremap ii i
      nnoremap m v

      

      " Kopieren (Yank) mit c
      nnoremap c y
      vnoremap c y

      " Ausschneiden (Delete + Kopieren) mit x  
      nnoremap x d
      vnoremap x d

      " Einfügen (Paste) mit v
      nnoremap v p
      vnoremap v p
      nnoremap V P
      vnoremap V P
      " ============ JETZT DEAKTIVIEREN WIR ALLE RESTLICHEN TASTEN ============

      " === Normal Mode (nnoremap) ===
      " Bewegungen die noch funktionieren
      nnoremap h <Nop>
      nnoremap ; <Nop>
      nnoremap , <Nop>
      nnoremap w <Nop>
      nnoremap b <Nop>
      nnoremap e <Nop>
      nnoremap $ <Nop>
      nnoremap 0 <Nop>
      nnoremap ^ <Nop>
      nnoremap G <Nop>
      nnoremap gg <Nop>
      nnoremap s <Nop>


      " Such- und Navigations-Tasten
      nnoremap / <Nop>
      nnoremap ? <Nop>
      nnoremap n <Nop>
      nnoremap N <Nop>
      nnoremap * <Nop>
      nnoremap # <Nop>

      " Änderungs-Operationen (da du eigene hast)
      nnoremap y <Nop>    " da du 'c' für yank verwendest
      nnoremap d <Nop>    " da du 'x' für delete verwendest  
      nnoremap p <Nop>    " da du 'v' für paste verwendest
      nnoremap P <Nop>    " da du 'V' für Paste-before verwendest

      " Insert-Modus Zugänge (da du 'ii' verwendest)
      nnoremap a <Nop>
      nnoremap A <Nop>
      nnoremap i <Nop>
      nnoremap I <Nop>
      nnoremap o <Nop>
      nnoremap O <Nop>

      " Visual Mode Zugänge
      nnoremap V <Nop>    " Visual Line mode

      " Undo/Redo
      nnoremap u <Nop>
      nnoremap <C-r> <Nop>

      " Replace mode
      nnoremap r <Nop>
      nnoremap R <Nop>

      " Window operations
      nnoremap <C-w>w <Nop>
      nnoremap <C-w>v <Nop>
      nnoremap <C-w>s <Nop>
      nnoremap <C-w>c <Nop>

      " === Visual Mode (vnoremap) ===
      " Änderungs-Operationen in Visual Mode
      vnoremap y <Nop>    " da du 'c' verwendest
      vnoremap d <Nop>    " da du 'x' verwendest
      vnoremap p <Nop>    " da du 'v' verwendest
      vnoremap P <Nop>    " da du 'V' verwendest

      " Indentation
      vnoremap < <Nop>
      vnoremap > <Nop>

      " === Insert Mode (inoremap) ===  
      " Escape Alternativen
      inoremap <C-c> <Nop>
      inoremap <C-[> <Nop>

      " Bewegung in Insert Mode
      inoremap <Up> <Nop>
      inoremap <Down> <Nop> 
      inoremap <Left> <Nop>
      inoremap <Right> <Nop>
      inoremap <Home> <Nop>
      inoremap <End> <Nop>

      " === Operator-pending Mode (onoremap) ===
      " Standard Textobjekte
      onoremap aw <Nop>
      onoremap iw <Nop>
      onoremap a" <Nop>
      onoremap i" <Nop>
      onoremap a' <Nop>
      onoremap i' <Nop>

      " === Command Line Mode (cnoremap) ===
      " Bewegung in Command Line
      cnoremap <C-a> <Nop>
      cnoremap <C-e> <Nop>
      cnoremap <C-f> <Nop>
      cnoremap <C-b> <Nop>

      " === Wichtige Modifier-Tasten ===
      " Ctrl, Alt, etc.
      nnoremap <C-d> <Nop>
      nnoremap <C-u> <Nop>
      nnoremap <C-f> <Nop>
      nnoremap <C-b> <Nop>
      nnoremap <C-o> <Nop>
      nnoremap <C-i> <Nop>

      " Function keys
      nnoremap <F1> <Nop>
      nnoremap <F2> <Nop>
      nnoremap <F3> <Nop>
      nnoremap <F4> <Nop>
      nnoremap <F5> <Nop>
      nnoremap <F6> <Nop>
      nnoremap <F7> <Nop>
      nnoremap <F8> <Nop>
      nnoremap <F9> <Nop>
      nnoremap <F10> <Nop>
      nnoremap <F11> <Nop>
      nnoremap <F12> <Nop>
    '';
  };
}