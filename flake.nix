{
  description = "Haskell 💞 Rust";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
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
            pkgs.haskellPackages.cabal-fmt
            pkgs.haskellPackages.ormolu
            (pkgs.haskell-language-server.override { supportedGhcVersions = [ "9101" ]; })
            (pkgs.rust-bin.nightly."2025-03-31".default.override {
              extensions = [
                "rust-src"
                "rust-analyzer-preview"
              ];
            })
          ];
          shellHook = ''
            export LD_LIBRARY_PATH=lib:$LD_LIBRARY_PATH
          '';
        };
      }
    );
}
