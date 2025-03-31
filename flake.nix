{
  description = "Haskell 💞 Rust";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.cabal-install
            pkgs.haskell.compiler.ghc910
            pkgs.rust-bin.nightly."2025-03-31".default
          ];
          shellHook = ''
            export LD_LIBRARY_PATH=lib:$LD_LIBRARY_PATH
          '';
        };
      }
    );
}
