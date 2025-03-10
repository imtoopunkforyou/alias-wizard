#!/bin/bash

if [ -z "$BASH_VERSION" ]; then
    echo "Please run this script in Bash."
    exit 1
fi

missing=()
for cmd in curl yq; do
    if ! command -v "$cmd" &> /dev/null; then
        missing+=("$cmd")
    fi
done

if [ ${#missing[@]} -gt 0 ]; then
    echo "Error: Missing required tools: ${missing[*]}"
    echo -e "\nInstallation instructions:"

    for pkg in "${missing[@]}"; do
        echo -e "\n=== ${pkg} ==="
        case "$pkg" in
            curl)
                echo "Install curl:"
                echo "- Debian/Ubuntu:   sudo apt install curl"
                echo "- Fedora/RHEL:     sudo dnf install curl"
                echo "- Arch Linux:      sudo pacman -S curl"
                echo "- macOS:           brew install curl"
                ;;
            yq)
                echo "Install yq:"
                echo "- Debian/Ubuntu: sudo apt install yq"
                echo "- Fedora:        sudo dnf install yq"
                echo "- Arch (AUR):    yay -S yq"
                echo "- macOS:         brew install yq"
                ;;
        esac
    done

    exit 1
else
    echo "All required tools are installed!"
    exit 0
fi