#!/bin/bash
# Script to grant execute permissions to all shell scripts in the current directory

echo "🔑 Making all .sh files executable in $(pwd)..."

# Check if any .sh files exist
if ls *.sh 1> /dev/null 2>&1; then
    chmod +x *.sh
    echo "✅ Permissions updated successfully for:"
    ls -1 *.sh
else
    echo "⚠️ No .sh files found in this directory."
fi
