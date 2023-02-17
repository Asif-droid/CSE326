#!/bin/bash

# File paths
<<<<<<< HEAD
pdf_file="input/req.pdf"
coordinates_file="input/coordinates.txt"
=======
pdf_file="input/test1.pdf"
coordinates_file="input/coordinateS.txt"
>>>>>>> f2242c9154fc3c2f10250b8dbe522d5c90c31570
output="intermediate/"

# Read the coordinates from the text file
while IFS= read -r line; do
    echo "$line"
    # Split the line into coordinates
    IFS=',' read -ra coord <<< "$line"
    x1=${coord[0]}
    y1=${coord[1]}
    x2=${coord[2]}
    y2=${coord[3]}
    page_num=${coord[4]}
    field_name=${coord[5]}
    
    echo "output: $output"

    # Call the Python script to crop the image
    python3 pdf_to_img.py "$pdf_file" "$output" "$x1" "$y1" "$x2" "$y2" "$page_num" "$field_name"
done < "$coordinates_file"
