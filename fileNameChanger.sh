#!/bin/bash

# Move to the directory where the files are located
cd /home/hadoop/amrtesting/Inventory/SimulatedFolder

# Rename files by removing the dates
rename -v 's/^\d{8}_//' *.csv.gz

