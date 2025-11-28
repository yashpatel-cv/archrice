#!/bin/bash
# Generate pure black OLED wallpaper
# This creates a 3840x2160 (4K) pure black PNG
# File size will be tiny (< 1KB) due to compression

# Create directory if needed
mkdir -p "$(dirname "$0")"

# Use ImageMagick/ffmpeg if available, otherwise create minimal file
if command -v convert >/dev/null 2>&1; then
    # ImageMagick method
    convert -size 3840x2160 xc:black "$0/../oled-black.png"
    echo "Created 4K black wallpaper with ImageMagick"
elif command -v ffmpeg >/dev/null 2>&1; then
    # FFmpeg method
    ffmpeg -f lavfi -i color=c=black:s=3840x2160:d=1 -frames:v 1 -y "$0/../oled-black.png"
    echo "Created 4K black wallpaper with FFmpeg"
else
    # Fallback: Create minimal 1x1 black PNG (will be scaled)
    # This is a valid 1x1 black PNG in base64
    base64 -d > "$0/../oled-black.png" << 'EOF'
iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==
EOF
    echo "Created 1x1 black wallpaper (will scale to screen size)"
fi

# Verify file was created
if [[ -f "$0/../oled-black.png" ]]; then
    ls -lh "$0/../oled-black.png"
    echo "✓ OLED black wallpaper created successfully"
else
    echo "✗ Failed to create wallpaper"
    exit 1
fi
