#!/bin/bash

echo -e "\n\n\n" | ssh-keygen -t ed25519 -C "ajeniski4@gmail.com"
echo "printing generated pub file:"
cat ~/.ssh/id_ed25519.pub

