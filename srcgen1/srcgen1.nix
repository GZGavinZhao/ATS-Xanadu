{ lib, stdenv, xatsopt, xats2js }:

stdenv.mkDerivation rec {
  pname = "srcgen1";
  version = (builtins.readFile ../VERSION);

  src = ./.;

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${xatsopt}/bin/xatsopt $out/bin/xatsopt
    ln -s ${xats2js}/bin/xats2js $out/bin/xats2js
  '';

  meta = with lib; {
    homepage = "https://github.com/githwxi/ATS-Xanadu";
    description = ''
      The ATS3 toolchain written in ATS2.
    '';
    licenses = licenses.gpl3Plus;
  };
}
