#!make

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		{printf "%-30s %s\n", $$1, $$2}' | \
		sort

typos: ## Check typos
	@typos

typos-fix: ## Fix typos
	@typos -w

rs-audit: ## Audit Cargo.lock
	@cargo audit

rs-audit-fix: ## Update Cargo.toml to fix vulnerable dependency requirement
	@cargo audit fix

rs-bench: ## Run benchmarks
	@cargo criterion && xdg-open target/criterion/reports/index.html

rs-build: ## Build binaries
	@cargo build --release --locked --frozen --bins

rs-cargo-deps: ## Install cargo dependencies
	@cargo install --locked cargo-outdated
	@cargo install cargo-audit --features=fix
	@cargo install cargo-bump
	@cargo install cargo-udeps --locked
	@cargo install cargo-watch
	@cargo install ripgrep
	@cargo install sd
	@cargo install typos-cli
	@rustup component add clippy

rs-dev: ## Run check in watch mode
	@cargo watch -c

rs-check: ## Run check
	@cargo check

rs-doc: ## Open app documentation
	@cargo doc --open

rs-fix: ## Fix rust code
	@cargo fix --allow-dirty --allow-staged --all-features --all-targets

rs-fmt: ## Format rust code
	@cargo fmt --all

rs-install: ## Install package
	@cargo install --path .

rs-uninstall: ## Uninstall package
	@cargo uninstall

rs-lint: ## Lint rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps -- -D warnings

rs-lint-fix: ## Fix lint rust code
	@cargo clippy --workspace --all-targets --all-features --no-deps --allow-dirty --allow-staged --fix -- -D warnings

rs-outdated: ## Display when dependencies are out of date
	@cargo outdated -wR

rs-tests: ## Run tests
	@cargo test

rs-udeps: ## Find unused dependencies
	@cargo +nightly udeps --all-targets

rs-update: ## Update dependencies
	@cargo update

rs-update-rustup:
	@rustup update

.PHONY: help
.PHONY: typos
.PHONY: typos-fix
.PHONY: rs-audit
.PHONY: rs-audit-fix
.PHONY: rs-bench
.PHONY: rs-build
.PHONY: rs-cargo-deps
.PHONY: rs-dev
.PHONY: rs-check
.PHONY: rs-doc
.PHONY: rs-fix
.PHONY: rs-fmt
.PHONY: rs-install
.PHONY: rs-uninstall
.PHONY: rs-lint
.PHONY: rs-lint-fix
.PHONY: rs-outdated
.PHONY: rs-release
.PHONY: rs-tests
.PHONY: rs-udeps
.PHONY: rs-update
.PHONY: rs-update-rustup
