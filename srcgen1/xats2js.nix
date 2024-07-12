{ lib, ats2, xatshome, boehmgc, makeWrapper, stdenv }:

stdenv.mkDerivation rec {
  pname = "xats2js";
  version = (builtins.readFile ../VERSION);

  src = ./.;

  nativeBuildInputs = [ makeWrapper ats2 ];

  buildInputs = [ boehmgc ];

  buildPhase = ''
    make -C xats2js/srcgen1 -j $NIX_BUILD_CORES xats2js
  '';

  env = { XATSHOME = "${xatshome}/share/xatshome"; };

  installPhase = ''
    install -Dm00755 xats2js/srcgen1/bin/xats2js $out/bin/xats2js

    wrapProgram $out/bin/xats2js \
      --set-default XATSHOME "${xatshome}/share/xatshome"
  '';

  meta = with lib; {
    homepage = "https://github.com/githwxi/ATS-Xanadu";
    description = ''
      xats2js is the ATS3 to JavaScript compiler written in ATS2.
    '';
    licenses = licenses.gpl3Plus;
  };
}
