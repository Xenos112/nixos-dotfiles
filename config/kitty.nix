{ config, pkgs, lib, ... }:

{
  stylix.targets.kitty.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      name = lib.mkForce "JetBrainsMono Nerd Font";
      size = lib.mkDefault 15;
    };

    settings = {
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      confirm_os_window_close = 0;
    };
  };

}
