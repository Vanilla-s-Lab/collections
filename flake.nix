{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in

      rec {
        busybox-static = pkgs.dockerTools.buildImage {
          name = "busybox-static";
          tag = "latest";

          copyToRoot = pkgs.buildEnv {
            name = "image-root";
            paths = [ pkgs.pkgsStatic.busybox ];
            pathsToLink = [ "/bin" ];
          };
        };
      });
}
