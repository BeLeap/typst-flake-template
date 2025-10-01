{
  description = "Typst flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    press.url = "github:RossSmyth/press";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      press,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import press) ];
        };
      in
      rec {
        packages.default = pkgs.buildTypstDocument {
          name = "main";
          src = ./.;
        };
        devShells.default = pkgs.mkShell {
          inputsFrom = [ packages.default ];
          packages = with pkgs; [
            tinymist
            typstyle
          ];
        };
      }
    );
}
