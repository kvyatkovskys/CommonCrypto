#!/bin/bash

rm -Rf Sources
mkdir Sources

xcodebuild archive \
-scheme CommonCrypto-iOS \
-destination "generic/platform=iOS" \
-archivePath Sources/CommonCrypto-iOS.xcarchive  \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CommonCrypto-iOS \
-destination "generic/platform=iOS Simulator" \
-archivePath Sources/CommonCrypto-iOS-simulator.xcarchive  \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CommonCrypto-iOS \
-destination "platform=macOS,arch=x86_64,variant=Mac Catalyst" \
-archivePath Sources/CommonCrypto-iOS-catalyst.xcarchive  \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework Sources/CommonCrypto-iOS.xcarchive/Products/Library/Frameworks/CommonCrypto.framework \
-framework Sources/CommonCrypto-iOS-simulator.xcarchive/Products/Library/Frameworks/CommonCrypto.framework \
-framework Sources/CommonCrypto-iOS-catalyst.xcarchive/Products/Library/Frameworks/CommonCrypto.framework \
-output Sources/XCCommonCrypto.xcframework