#!/bin/bash
set -euo pipefail

# Update package list
sudo apt update

# List of common software to install
software_list=(
    "vim"
    "git"
    "curl"
    "wget"
    "htop"
    "nmap"
    "tree"
    "zip"
    "unzip"
    "zsh"
    "xclip"
    "hydrapaper"
    "flameshot"
)

# Lists to track successful and failed installations
success_list=()
fail_list=()

# Install common software
for software in "${software_list[@]}"
do
    if ! dpkg -l | grep -q "^ii  $software "  # Check if the software is already installed
    then
        echo "Installing $software..."
        if sudo apt install -y "$software"; then
            echo "$software installed successfully!"
            success_list+=("$software")
        else
            echo "Failed to install $software, skipping..."
            fail_list+=("$software")
        fi
    else
        echo "$software is already installed, skipping..."
    fi
done

# Output installation results
echo
echo "Successfully installed software:"
for software in "${success_list[@]}"
do
    echo "- $software"
done

if [ ${#fail_list[@]} -eq 0 ]; then
    echo "All software installed successfully!"
else
    echo
    echo "Failed to install the following software:"
    for software in "${fail_list[@]}"
    do
        echo "- $software"
    done
fi
