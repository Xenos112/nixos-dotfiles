{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      # Monitor configuration
      monitor = ",preferred,auto,1";

      # Environment variables
      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "GTK_CURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
        "GTK_CURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # Variable definitions
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";
      "$browser" = "zen-browser";
      "$mainMod" = "SUPER";

      # Catppuccin color scheme
      "$rosewater" = "rgb(f5e0dc)";
      "$flamingo" = "rgb(f2cdcd)";
      "$pink" = "rgb(f5c2e7)";
      "$mauve" = "rgb(cba6f7)";
      "$red" = "rgb(f38ba8)";
      "$maroon" = "rgb(eba0ac)";
      "$peach" = "rgb(fab387)";
      "$yellow" = "rgb(f9e2af)";
      "$green" = "rgb(a6e3a1)";
      "$teal" = "rgb(94e2d5)";
      "$sky" = "rgb(89dceb)";
      "$sapphire" = "rgb(74c7ec)";
      "$blue" = "rgb(89b4fa)";
      "$lavender" = "rgb(b4befe)";
      "$text" = "rgb(cdd6f4)";
      "$subtext1" = "rgb(bac2de)";
      "$subtext0" = "rgb(a6adc8)";
      "$overlay2" = "rgb(9399b2)";
      "$overlay1" = "rgb(7f849c)";
      "$overlay0" = "rgb(6c7086)";
      "$surface2" = "rgb(585b70)";
      "$surface1" = "rgb(45475a)";
      "$surface0" = "rgb(313244)";
      "$base" = "rgb(1e1e2e)";
      "$mantle" = "rgb(181825)";
      "$crust" = "rgb(11111b)";

      "$borderColor" = "$surface2";
      "$inactiveColor" = "$surface0";

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$borderColor";
        "col.inactive_border" = "$inactiveColor";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 4;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Input settings
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        repeat_rate = 40;
        repeat_delay = 150;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      # Animation settings
      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear,fade"
          "workspacesIn,1,1.21,almostLinear,fade"
          "workspacesOut,1,1.94,almostLinear,fade"
          "zoomFactor,1,7,quick"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Misc settings
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # Gesture
      gesture = "3,horizontal,workspace";

      # Device specific settings
      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      # Keybindings
      bind = [
        "$mainMod,Return,exec,$terminal"
        "$mainMod,Q,killactive,"
        "$mainMod,M,exit,"
        "$mainMod,E,exec,$fileManager"
        "$mainMod,B,exec,$browser"
        "$mainMod,T,exec,$HOME/.config/xenos/theme.sh"
        "$mainMod SHIFT,T,exec,$HOME/.config/xenos/wallpaper.sh"
        "$mainMod,V,togglefloating,"
        "$mainMod,R,exec,$menu"
        "$mainMod,P,pseudo,"
        "$mainMod,J,togglesplit,"
        "$mainMod,F,fullscreen,"
        "$mainMod,left,movefocus,l"
        "$mainMod,right,movefocus,r"
        "$mainMod,up,movefocus,u"
        "$mainMod,down,movefocus,d"
        # Workspaces
        "$mainMod,1,workspace,1"
        "$mainMod,2,workspace,2"
        "$mainMod,3,workspace,3"
        "$mainMod,4,workspace,4"
        "$mainMod,5,workspace,5"
        "$mainMod,6,workspace,6"
        "$mainMod,7,workspace,7"
        "$mainMod,8,workspace,8"
        "$mainMod,9,workspace,9"
        "$mainMod,0,workspace,10"
        "$mainMod SHIFT,1,movetoworkspace,1"
        "$mainMod SHIFT,2,movetoworkspace,2"
        "$mainMod SHIFT,3,movetoworkspace,3"
        "$mainMod SHIFT,4,movetoworkspace,4"
        "$mainMod SHIFT,5,movetoworkspace,5"
        "$mainMod SHIFT,6,movetoworkspace,6"
        "$mainMod SHIFT,7,movetoworkspace,7"
        "$mainMod SHIFT,8,movetoworkspace,8"
        "$mainMod SHIFT,9,movetoworkspace,9"
        "$mainMod SHIFT,0,movetoworkspace,10"
        "$mainMod,S,togglespecialworkspace,magic"
        "$mainMod SHIFT,S,movetoworkspace,special:magic"
        "$mainMod,mouse_down,workspace,e+1"
        "$mainMod,mouse_up,workspace,e-1"
        # Screenshots
        ",Print,exec,grim -g \"$(slurp)\" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify \"Screenshot of the region taken\" -t 1000"
        "SHIFT,Print,exec,grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify \"Screenshot of whole screen taken\" -t 1000"
      ];

      bindm = [
        "$mainMod,mouse:272,movewindow"
        "$mainMod,mouse:273,resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp,exec,brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown,exec,brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ",XF86AudioNext,exec,playerctl next"
        ",XF86AudioPause,exec,playerctl play-pause"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioPrev,exec,playerctl previous"
      ];

      # Startup applications
      exec-once = [
        "waybar"
        "blueman-applet"
        "swww-daemon"
      ];
    };
  };
}
