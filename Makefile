.PHONY: run
run: build
	cabal run

.PHONY: build
build:
	cargo build -Z unstable-options --artifact-dir=lib
	cabal build

.PHONY: fmt
fmt:
	cargo fmt
	cabal-fmt -i *.cabal
	ormolu -i $$(find hs -name "*.hs")
