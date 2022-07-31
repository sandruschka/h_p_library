.PHONY: help
.DEFAULT_GOAL = help

install: ## Dependency installation
	@flutter pub get

build-runner: install ## Build Flutter dependencies
	@flutter pub run build_runner build --delete-conflicting-outputs