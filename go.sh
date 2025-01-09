#!/bin/bash
set -e

# Determine latest Go version, getting first line only
LATEST_GO_VERSION=$(curl -sSL https://golang.org/VERSION?m=text | head -n1)

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
arm64 | aarch64)
    GOARCH="arm64"
    ;;
x86_64 | amd64)
    GOARCH="amd64"
    ;;
*)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# Set OS and download URL
OS="linux"
DOWNLOAD_URL="https://go.dev/dl/${LATEST_GO_VERSION}.${OS}-${GOARCH}.tar.gz"

# remove existing Go installation
sudo rm -rf /usr/local/go

# Download and install Go
echo "Downloading Go from $DOWNLOAD_URL..."
curl -sSL "$DOWNLOAD_URL" | sudo tar -C /usr/local -xzf -

if ! grep -q "/usr/local/go/bin" "$HOME/.bashrc"; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >>"$HOME/.bashrc"
fi

if ! grep -q '$HOME/go/bin' "$HOME/.bashrc"; then
    echo 'export PATH=$PATH:$HOME/go/bin' >>"$HOME/.bashrc"
fi

# Verify installation
go version
