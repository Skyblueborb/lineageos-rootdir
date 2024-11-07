#!/bin/bash

# Set the current script's directory
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Array of link names
LINKS=("gen_picks" "gen_chain" "picks")

# Loop through each item and create a symlink in the parent directory
for link_name in "${LINKS[@]}"; do
    # Check if the symlink already exists, and if not, create it
    if [[ ! -L "$PARENT_DIR/$link_name" ]]; then
        ln -s "$SCRIPT_DIR/$link_name" "$PARENT_DIR/$link_name"
        echo "Created symlink for $link_name in $PARENT_DIR"
    else
        echo "Symlink for $link_name already exists in $PARENT_DIR"
    fi
done

ln -s $SCRIPT_DIR/.repo/local_manifests/sky.xml $PARENT_DIR/.repo/local_manifests/sky.xml
