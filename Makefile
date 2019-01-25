.PHONY: archive
archive:
	make generate-xcodeproj; \
	carthage build --archive

.PHONY: build
build:
	swift build

.PHONY: generate-xcodeproj
generate-xcodeproj:
	rm -rf Result.xcodeproj/; \
	swift package generate-xcodeproj \
		--xcconfig-overrides Config.xcconfig

.PHONY: lint
lint:
	swiftlint

.PHONY: test
test:
	swift test
