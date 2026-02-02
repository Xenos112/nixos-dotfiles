{ config, pkgs, ... }:

{
  services.getty = {
    autologinUser = "xenos";
  };
  
  systemd.services."getty@tty1".enable = true;
  systemd.services."autovt@tty1".enable = true;

  # Auto-start Hyprland after login on tty1
  environment.loginShellInit = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec Hyprland
    fi
  '';
}
