#!/bin/zsh
# Archive and export App Store builds for macOS and iOS using the
# whitespace-build keychain and the App Store profiles (manual signing).
set -euo pipefail
cd ~/Developer/whitespace-hider
P="Whitespace Hider for GitHub"
K=~/Library/Keychains/whitespace-build.keychain-db
security unlock-keychain -p "$(cat ~/Developer/gh-secrets/BUILD_KEYCHAIN_PASSWORD.txt)" "$K"
rm -rf build && mkdir build
for plat in macOS iOS; do
  if [[ $plat == macOS ]]; then pt=macOS; else pt=iOS; fi
  cat > build/export-$plat.plist <<PL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>method</key><string>app-store-connect</string>
<key>destination</key><string>export</string>
<key>signingStyle</key><string>manual</string>
<key>teamID</key><string>RWGDZAYBM8</string>
<key>signingCertificate</key><string>Apple Distribution</string>
<key>installerSigningCertificate</key><string>3rd Party Mac Developer Installer</string>
<key>provisioningProfiles</key><dict>
<key>org.shirls.whitespacehider</key><string>Whitespace Hider App $pt App Store</string>
<key>org.shirls.whitespacehider.Extension</key><string>Whitespace Hider Extension $pt App Store</string>
</dict></dict></plist>
PL
  echo "=== $plat archive"
  xcodebuild archive -project "$P/$P.xcodeproj" -scheme "$P ($plat)" -configuration Release \
    -destination "generic/platform=$plat" -archivePath build/$plat.xcarchive 2>&1 | grep -E "error|ARCHIVE" || true
  echo "=== $plat export"
  xcodebuild -exportArchive -archivePath build/$plat.xcarchive -exportOptionsPlist build/export-$plat.plist \
    -exportPath build/$plat-export 2>&1 | grep -E "error|EXPORT" || true
  ls build/$plat-export 2>/dev/null || true
done
