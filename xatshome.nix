{ lib
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "xatshome";
  version = (builtins.readFile ./VERSION);

  src = ./.;

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/xatshome
    cp -R $src/. $out/share/xatshome/
  '';

  meta = with lib; {
    homepage = "https://github.com/githwxi/ATS-Xanadu";
    description = ''
      XATSHOME stores the standard library and friends. It's located at $out/share/xatshome
    '';
    licenses = licenses.gpl3Plus;
  };
}
