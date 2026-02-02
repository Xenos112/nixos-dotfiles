{ pkgs, lib, ... }:

let
  version = "0.8.3.1";
  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
    hash = "sha256-GGltZ0/6rGQJixlGz3Na/vAwOlTeUR87WGyAPpLmtKM=";
  };
in
pkgs.appimageTools.wrapType2 rec {
  pname = "helium";
  inherit version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cp ${pkgs.appimageTools.extractType2 {inherit pname version src;}}/${pname}.desktop $out/share/applications/
    substituteInPlace $out/share/applications/${pname}.desktop --replace-fail 'Exec=AppRun' 'Exec=helium'
  '';

  meta = {
    description = "Private, fast, and honest web browser";
    license = lib.licenses.gpl3;
    mainProgram = "helium";
  };
}
