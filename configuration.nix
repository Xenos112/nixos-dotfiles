{ config, pkgs, ... }:

let
  helium = pkgs.callPackage ./extra/helium.nix {};
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./config/tlp.nix
      ./config/getty.nix
      ./config/ollama.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_DZ.UTF-8";
    LC_IDENTIFICATION = "ar_DZ.UTF-8";
    LC_MEASUREMENT = "ar_DZ.UTF-8";
    LC_MONETARY = "ar_DZ.UTF-8";
    LC_NAME = "ar_DZ.UTF-8";
    LC_NUMERIC = "ar_DZ.UTF-8";
    LC_PAPER = "ar_DZ.UTF-8";
    LC_TELEPHONE = "ar_DZ.UTF-8";
    LC_TIME = "ar_DZ.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Disable auto-login on other TTYs if needed
  systemd.services."getty@tty2".enable = true;

  # Enable Zsh
  programs.zsh.enable = true;
  users.users.xenos.shell = pkgs.zsh;

  # Enable Hyprland
  programs.hyprland = {
  	enable = true;
    xwayland.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xenos = {
    isNormalUser = true;
    description = "xenos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    firefox
    kitty
    waybar
    nodejs
    python3
    bun
    bibata-cursors
    rofi
    swww
    helium
    opencode
    gh
    uv
    lazygit
    grim
    slurp
    brightnessctl
    fzf
    repgrep
    tmux
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";

  # Fonts
  fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
}
