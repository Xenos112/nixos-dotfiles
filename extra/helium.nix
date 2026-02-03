{ pkgs, lib, ... }:

let
  version = "0.8.3.1";
  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    hash = "sha256-GGltZ0/6rGQJixlGz3Na/vAwOlTeUR87WGyAPpLmtKM=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {
    pname = "helium";
    inherit version src;
  };
in
pkgs.appimageTools.wrapType2 {
  pname = "helium";
  inherit version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications $out/share/icons/hicolor/256x256/apps
    
    # Copy and fix the desktop file
    cp ${appimageContents}/helium.desktop $out/share/applications/
    substituteInPlace $out/share/applications/helium.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=helium'
    
    # Copy the icon (check what icon files are in the AppImage)
    if [ -f ${appimageContents}/helium.png ]; then
      cp ${appimageContents}/helium.png $out/share/icons/hicolor/256x256/apps/
    elif [ -f ${appimageContents}/.DirIcon ]; then
      cp ${appimageContents}/.DirIcon $out/share/icons/hicolor/256x256/apps/helium.png
    else
      # Find any png/svg in the extracted contents
      find ${appimageContents} -maxdepth 1 \( -name "*.png" -o -name "*.svg" \) -exec cp {} $out/share/icons/hicolor/256x256/apps/helium.png \;
    fi
    
    # Update desktop file to point to the installed icon
    substituteInPlace $out/share/applications/helium.desktop \
      --replace-fail 'Icon=helium' 'Icon=helium' \
      || substituteInPlace $out/share/applications/helium.desktop \
      --replace-fail 'Icon=' 'Icon=helium # fixed: '
  '';

  meta = {
    description = "Private, fast, and honest web browser";
    license = lib.licenses.gpl3;
    mainProgram = "helium";
  };
}
