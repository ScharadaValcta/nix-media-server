{
  programs.zsh = {
    enable = true;
    shellInit =  ''
      export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/themes/"
      #export $ZSHAPHRODITE="$HOME/.oh-my-zsh/custom/themes/aphrodite"
      if [ ! -d "$HOME/.oh-my-zsh/custom/themes/aphrodite" ]; then
        git clone https://github.com/win0err/aphrodite-terminal-theme "$HOME/.oh-my-zsh/custom/themes/aphrodite"
      fi
      neofetch
    '';
    ohMyZsh = {
      enable = true;
      theme = "aphrodite/aphrodite";
      plugins = [
        "git"
      ];
    };
    enableCompletion = true;
  };
}
