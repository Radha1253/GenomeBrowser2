#!/bin/bash

# Navigate to your JBrowse directory
cd /Users/rajninitturi/Desktop/VariantVizTest

echo "Starting to load BigWig tracks from ~/Desktop/BW/"
echo "========================================="

# Loop through all .bw files in the Desktop/BW directory
for file in ~/Desktop/BW/*.bw; do
    # Get just the filename without path and extension
    filename=$(basename "$file" .bw)
    
    echo "Adding track: $filename"
    
    # Add the track to JBrowse with hg19 assembly
    jbrowse add-track "$file" \
        --load copy \
        --name "$filename" \
        --category "NHP,BigWig,Quantitative" \
        --assemblyNames "hg19" \
        --target test_data/config.json
    
    if [ $? -eq 0 ]; then
        echo "✓ Successfully added: $filename"
    else
        echo "✗ Failed to add: $filename"
    fi
    echo "---"
done

echo "========================================="
echo "Finished loading all BigWig tracks!"
