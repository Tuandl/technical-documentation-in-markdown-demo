#!/usr/bin/env bash
set -euo pipefail

# Step 1: Copy SSH keys from the mounted host SSH directory to the container's ~/.ssh directory
SRC="/host-ssh-readonly"
DEST="${HOME:-/root}/.ssh"

if [ ! -d "$SRC" ]; then
    echo "Directory $SRC does not exist." >&2
else
    echo "Preapring the ~/.ssh folder" >&2
    mkdir -p "$DEST"
    chmod 700 "$DEST"

    # Copy all contents (including hidden files), preserving attributes
    cp -a "$SRC/." "$DEST/"

    # Best-effort: tighten permissions for private keys and set sensible perms for public keys
    find "$DEST" -type f ! -name "*.pub" -exec chmod 600 {} + 2>/dev/null || true
    find "$DEST" -type f -name "*.pub" -exec chmod 644 {} + 2>/dev/null || true
fi

# Step 2: Configure existing git from the host
SRC="/host-gitconfig-readonly"
DEST="${HOME:-/root}/.gitconfig"

if [ -f "$SRC" ]; then
    echo "Configuring git from the host gitconfig" >&2
    cp "$SRC" "$DEST"
else
    echo "Host gitconfig $SRC does not exist. Skipping git configuration." >&2
fi

# Step 3: Install material-mkdocs
echo "Installing material-mkdocs..." >&2
pip install mkdocs-material

# Step 4: Install social card plugins
echo "Installing mkdocs-social-cards plugin..." >&2
pip install mkdocs-material[imaging]

sudo apt-get update
sudo apt-get install -y libcairo2

echo "Dev container initialization complete." >&2