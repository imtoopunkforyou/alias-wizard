#!/bin/bash

URL="https://raw.githubusercontent.com/imtoopunkforyou/alias-wizard/refs/heads/main/config/aliases.yaml"
filename=$(basename "$URL")

if [[ ! "$filename" =~ \.ya?ml$ ]]; then
    echo "❌ Error: URL must point to a .yaml or .yml file." >&2
    exit 1
fi

if ! curl -L -o "$filename" "$URL"; then
    echo "❌ Error: Failed to download file" >&2
    exit 1
fi

echo "✅ File successfully saved to: $(pwd)/$filename"