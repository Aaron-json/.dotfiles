#!/bin/bash

GO_VERSION=1.23.4
DOWNLOAD_URL="https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"

rm -rf /usr/local/go

temp_dir=$(mktemp -d)
trap 'rm -rf "$temp_dir"' EXIT

# downlaod go
echo "Downloading go $GO_VERSION"
wget -O "$temp_dir/go.tar.gz" "$DOWNLOAD_URL"

# remove old go installation
echo "Removing old go installation"
rm -rf /usr/local/go

# install go
echo "Installing go"
tar -C /usr/local -xzf "$temp_dir/go.tar.gz"

rm -rf "$temp_dir"
