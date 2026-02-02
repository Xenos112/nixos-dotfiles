{ config, pkgs, ... }:
{
  imports = [
    ./config/git.nix
    ./config/zsh.nix
    ./config/tmux.nix
    ./config/hyprland.nix
    ./config/kitty.nix
  ];

	home.username = "xenos";
	home.homeDirectory = "/home/xenos";
	home.stateVersion = "25.05";


	home.file.".config/waybar".source = ./config/waybar;
	home.file.".config/kitty".source = ./config/kitty;
	home.file.".config/nvim".source = ./config/nvim;
	home.file.".config/rofi".source = ./config/rofi;
	home.file.".config/xenos".source = ./config/xenos;
}
