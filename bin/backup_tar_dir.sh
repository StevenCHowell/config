for FOLDER in */
do
    BASE=$(basename "$FOLDER")
    TODAY=$(date +%Y%m%d)
    tar -zcvf "${TODAY}-${BASE}.tar.gz" "$FOLDER"
done
