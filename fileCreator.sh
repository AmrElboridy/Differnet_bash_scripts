#!/bin/bash

directory="/home/hadoop/amrtesting/Inventory/SimulatedFolder"  # Specify the directory path here

file_names=(
    "20230514_AIRU.csv.gz"
    "20230514_BBU.csv.gz"
    "20230514_BBUType.csv.gz"
    "20230514_BRU.csv.gz"
    "20230514_BW_UARFCN_EARFCN_3G.csv.gz"
    "20230514_BW_UARFCN_EARFCN_4G.csv.gz"
    "20230514_BaseBand_3G.csv.gz"
    "20230514_BaseBand_LTE.csv.gz"
    "20230514_Card.csv.gz"
    "20230514_Cards_3G_4G.csv.gz"
    "20230514_Cards_3G_4G_MassiveMIMO.csv.gz"
    "20230514_DRRU.csv.gz"
    "20230514_M2000_2G_Cells.csv.gz"
    "20230514_M2000_3G_Cells.csv.gz"
    "20230514_M2000_4G_Cells.csv.gz"
    "20230514_M2000_4G_Cells_cross_sector.csv.gz"
    "20230514_MPMU.csv.gz"
    "20230514_MPRF.csv.gz"
    "20230514_MRFU.csv.gz"
    "20230514_MRRU.csv.gz"
    "20230514_NWCards.csv.gz"
    "20230514_RFU.csv.gz"
    "20230514_TRX.csv.gz"
    "20230514_UBBP.csv.gz"
    "20230514_UMPT.csv.gz"
    "20230514_UPEU.csv.gz"
    "20230514_WBBP.csv.gz"
    "20230514_WLANCARD.csv.gz"
    "20230514_WMPT.csv.gz"
    "20230514_WRFU.csv.gz"
    "20230514_retData.csv.gz"
    "20230514_retData_All.csv.gz"
)

for file_name in "${file_names[@]}"; do
    touch "$directory/$file_name"
    echo "Created file: $directory/$file_name"
done
