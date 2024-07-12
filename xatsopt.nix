{ lib
, ats2
, xatshome
, boehmgc
, makeWrapper
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "xatsopt";
  version = (builtins.readFile ./VERSION);

  src = ./.;

  nativeBuildInputs = [ makeWrapper ats2 ];

  buildInputs = [ boehmgc ];

  buildPhase = ''
    make -C srcgen1 -j $NIX_BUILD_CORES xatsopt
  '';

  installPhase = ''
    install -Dm00755 srcgen1/bin/xatsopt $out/bin/xatsopt

    wrapProgram $out/bin/xatsopt \
      --set-default XATSHOME "${xatshome}/share/xatshome"
  '';

  meta = with lib; {
    homepage = "https://github.com/githwxi/ATS-Xanadu";
    description = ''
      xatsopt is the ATS3 to JavaScript compiler written in ATS2.
    '';
    licenses = licenses.gpl3Plus;
  };
}
