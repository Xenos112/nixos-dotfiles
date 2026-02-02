{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "ls -la";
      la = "ls -a";
      update = "sudo nixos-rebuild switch --flake /home/xenos/dotfiles#nixos";
      hm-update = "home-manager switch";
      
      # Git aliases
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      
      # Programing aliases
      v = "nvim";
      lg = "lazygit";
    };
    
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    
    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo" 
      ];
    };
    
    # Powerlevel10k theme
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    
    initContent = ''
      # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
  
}
