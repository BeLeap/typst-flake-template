{
  description = "Typst flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        typst = pkgs.typst.withPackages (p: with p; [ ]);
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            typst
            tinymist
          ];
        };
      }
    );
}
