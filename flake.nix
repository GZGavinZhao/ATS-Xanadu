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

        xatshome = pkgs.callPackage ./xatshome.nix {};

        xatsopt = pkgs.callPackage ./xatsopt.nix { inherit xatshome; };
      in {
        packages = {
          inherit xatsopt;
          inherit xatshome;
          default = xatsopt;
        };

        apps = {
          xatsopt = flake-utils.lib.mkApp { 
            drv = self.packages.${system}.xatsopt; 
            exePath = "/bin/xatsopt";
          };
          default = self.apps.${system}.xatsopt;
        };
      }
  );
}
