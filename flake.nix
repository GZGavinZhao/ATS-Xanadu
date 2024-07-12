{
  description = "Nix flake for ATS3.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        xatshome = pkgs.callPackage ./xatshome.nix { };

        srcgen1 = {
          xatsopt =
            pkgs.callPackage ./srcgen1/xatsopt.nix { inherit xatshome; };
          xats2js =
            pkgs.callPackage ./srcgen1/xats2js.nix { inherit xatshome; };
          all = pkgs.callPackage ./srcgen1/srcgen1.nix {
            xatsopt = srcgen1.xatsopt;
            xats2js = srcgen1.xats2js;
          };
        };

        srcgen = srcgen1;
      in {
        packages = {
          inherit xatshome;
          xatsopt = srcgen.xatsopt;
          xats2js = srcgen.xats2js;
          default = srcgen.all;
        };

        apps = {
          xatsopt = flake-utils.lib.mkApp { drv = srcgen.xatsopt; };
          xats2js = flake-utils.lib.mkApp { drv = srcgen.xats2js; };
        };
      });
}
