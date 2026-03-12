#!/bin/sh
# Usage: ./update-formula.sh <version>
# Example: ./update-formula.sh 0.1.0
#
# This script fetches SHA256 checksums from a GitHub release and updates Formula/podwise.rb.
# Run this script from the root of the homebrew-tap repository after each new release.

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.1.0"
  exit 1
fi

VERSION="$1"
BASE_URL="https://github.com/hardhackerlabs/podwise-cli/releases/download/v${VERSION}"

echo "Fetching checksums for v${VERSION}..."
CHECKSUMS=$(curl -sL "${BASE_URL}/checksums.txt")

get_sha256() {
  echo "$CHECKSUMS" | grep "$1" | awk '{print $1}'
}

SHA_DARWIN_ARM64=$(get_sha256 "podwise_darwin_arm64.tar.gz")
SHA_DARWIN_AMD64=$(get_sha256 "podwise_darwin_amd64.tar.gz")
SHA_LINUX_ARM64=$(get_sha256 "podwise_linux_arm64.tar.gz")
SHA_LINUX_AMD64=$(get_sha256 "podwise_linux_amd64.tar.gz")

if [ -z "$SHA_DARWIN_ARM64" ] || [ -z "$SHA_DARWIN_AMD64" ] || [ -z "$SHA_LINUX_ARM64" ] || [ -z "$SHA_LINUX_AMD64" ]; then
  echo "Error: Could not fetch one or more checksums. Check that v${VERSION} release exists on GitHub."
  exit 1
fi

echo "darwin_arm64 : $SHA_DARWIN_ARM64"
echo "darwin_amd64 : $SHA_DARWIN_AMD64"
echo "linux_arm64  : $SHA_LINUX_ARM64"
echo "linux_amd64  : $SHA_LINUX_AMD64"

FORMULA="Formula/podwise.rb"

sed -i.bak "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA"
sed -i.bak "s/REPLACE_WITH_SHA256_DARWIN_ARM64/${SHA_DARWIN_ARM64}/" "$FORMULA"
sed -i.bak "s/REPLACE_WITH_SHA256_DARWIN_AMD64/${SHA_DARWIN_AMD64}/" "$FORMULA"
sed -i.bak "s/REPLACE_WITH_SHA256_LINUX_ARM64/${SHA_LINUX_ARM64}/" "$FORMULA"
sed -i.bak "s/REPLACE_WITH_SHA256_LINUX_AMD64/${SHA_LINUX_AMD64}/" "$FORMULA"
sed -i.bak "/sha256 \"[a-f0-9]\{64\}\"/!{/sha256 \"REPLACE_WITH/d}" "$FORMULA"
rm -f "${FORMULA}.bak"

echo ""
echo "Formula/podwise.rb updated to v${VERSION}."
echo "Review the changes, then commit and push:"
echo "  git add Formula/podwise.rb"
echo "  git commit -m \"podwise v${VERSION}\""
echo "  git push"
