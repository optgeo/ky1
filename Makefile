# Clean up intermediate files
clean:
	# No intermediate files to remove
# Kyrgyzstan Admin Boundaries PMTiles Makefile

SRC_ZIP_URL=https://data.humdata.org/dataset/693aca77-1252-4404-9045-785e43bb6846/resource/ec494f47-9c13-4f0d-a0e3-8c2b6c1e8777/download/kgz-administrative-divisions-geodatabase.zip
SRC_ZIP=src/kgz-administrative-divisions-geodatabase.zip
SRC_GDB=src/KGZ_AdminBoundaries_candidate.gdb
ADM1_LAYER=kgz_admbnda_adm1_moes_20181119

.PHONY: all download extract produce

all: produce

# Download source data

download:
	mkdir -p src
	curl -L $(SRC_ZIP_URL) -o $(SRC_ZIP)

# Extract zip

extract: $(SRC_ZIP)
	unzip -d src $(SRC_ZIP)

# Produce PMTiles

produce: $(SRC_GDB)
	ogr2ogr -f GeoJSONSeq /vsistdout/ $(SRC_GDB) $(ADM1_LAYER) \
	| ruby add_ja.rb /dev/stdin enja.tsv \
	| tippecanoe -o docs/ky1.pmtiles --force --read-parallel --layer=adm1 --minimum-zoom=0 --maximum-zoom=6 --attribution="Ministry of Emergency Situations of the Kyrgyz Republic / OCHA Middle East and North Africa (ROMENA)"
