#!/bin/bash
#
# update-brave.sh
# Downloads the latest linux-amd64 Brave Browser release from GitHub,
# extracts it into ~/.local/bin/brave-browser, and symlinks the binary
# into /usr/local/bin/brave.
#
set -euo pipefail

REPO="brave/brave-browser"
INSTALL_DIR="${HOME}/.local/bin/brave-browser"
LINK_PATH="/usr/local/bin/brave"
TMP_DIR="/tmp"

echo "==> Resolving latest ${REPO} ..."

# github.com/OWNER/REPO/releases/latest 302-redirects to .../releases/tag/vX.Y.Z
FINAL_URL="$(curl -sSL -o /dev/null -w '%{url_effective}' \
    "https://github.com/${REPO}/releases/latest")"
CURL_STATUS=$?

echo "==> curl exit status: ${CURL_STATUS}"
echo "==> Resolved URL: ${FINAL_URL}"

if [[ "$CURL_STATUS" -ne 0 ]]; then
    echo "curl failed to reach github.com (exit ${CURL_STATUS}). Check your network/proxy settings." >&2
    exit 1
fi

TAG="$(printf '%s' "$FINAL_URL" | sed -E 's#.*/releases/tag/(v[0-9.]+).*#\1#')"

if [[ -z "$TAG" || "$TAG" == "$FINAL_URL" ]]; then
    echo "Could not parse a release tag out of: ${FINAL_URL}" >&2
    exit 1
fi

echo "==> Latest tag: ${TAG}"

VERSION="${TAG#v}"
ASSET_NAME="brave-browser-${VERSION}-linux-amd64.zip"
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/${TAG}/${ASSET_NAME}"

echo "==> Download URL: ${DOWNLOAD_URL}"

ZIP_PATH="${TMP_DIR}/${ASSET_NAME}"

echo "==> Latest version: ${VERSION}"

# Skip if this exact version is already installed
CURRENT_VERSION=""
if [[ -x "${INSTALL_DIR}/brave" ]]; then
    CURRENT_VERSION="$("${INSTALL_DIR}/brave" --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1 || true)"
fi

if [[ "$CURRENT_VERSION" == "$VERSION" ]]; then
    echo "==> Brave ${VERSION} is already installed. Nothing to do."
    exit 0
fi

echo "==> Downloading ${ASSET_NAME} to ${TMP_DIR}..."
curl -fL --progress-bar -o "$ZIP_PATH" "$DOWNLOAD_URL"

echo "==> Extracting to ${INSTALL_DIR}..."
rm -rf "${INSTALL_DIR}.new"
mkdir -p "${INSTALL_DIR}.new"
unzip -q "$ZIP_PATH" -d "${INSTALL_DIR}.new"

# Swap old install dir for new one atomically-ish
if [[ -d "$INSTALL_DIR" ]]; then
    rm -rf "${INSTALL_DIR}.old"
    mv "$INSTALL_DIR" "${INSTALL_DIR}.old"
fi
mv "${INSTALL_DIR}.new" "$INSTALL_DIR"
rm -rf "${INSTALL_DIR}.old"

chmod +x "${INSTALL_DIR}/brave"

echo "==> Linking ${LINK_PATH} -> ${INSTALL_DIR}/brave"
sudo ln -sf "${INSTALL_DIR}/brave" "$LINK_PATH"

echo "==> Cleaning up ${ZIP_PATH}"
rm -f "$ZIP_PATH"

echo "==> Done. Installed Brave ${VERSION} at ${LINK_PATH}"
"$LINK_PATH" --version || true
