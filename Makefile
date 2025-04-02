.PHONY: run
run: build
	cabal run

.PHONY: build
build:
	cargo build -Z unstable-options --artifact-dir=lib
	cabal update
	cabal build

.PHONY: clean
clean:
	cargo clean
	cabal clean
	rm -rf lib

.PHONY: fmt
fmt:
	cargo fmt
	cabal-fmt -i *.cabal
	ormolu -i $$(find hs -name "*.hs")

.PHONY: update
update:
	nix flake update
	cargo update
	cabal update
	cabal build --upgrade-dependencies
