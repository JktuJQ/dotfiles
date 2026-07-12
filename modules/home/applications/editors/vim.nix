{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      ignorecase = true;
      smartcase = true;
      mouse = "a";
    };

    extraConfig = ''
      set backspace=indent,eol,start
      set clipboard=unnamedplus
      set hlsearch
      set incsearch
      set ruler
      set smartindent
      syntax on
      filetype plugin indent on
    '';
  };

  home.sessionVariables.EDITOR = "nvim";
}
