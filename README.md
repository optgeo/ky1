

# Kyrgyzstan Administrative Boundaries PMTiles
このリポジトリは、キルギス共和国の第1レベル行政区画（州）境界データからPMTilesファイル（`docs/ky1.pmtiles`）を生成する再現可能なワークフローを提供します。GitHub Pages等でのWebマップ公開に利用できます。


## Workflow Overview / ワークフロー概要

1. **Download source data / ソースデータのダウンロード**
   - Download official administrative boundary data (Geodatabase) from Humanitarian Data Exchange (HDX).
   - Humanitarian Data Exchange (HDX) より公式行政境界データ（Geodatabase）を取得します。
     [Kyrgyzstan - Administrative Boundaries - HDX](https://data.humdata.org/dataset/cod-ab-kgz)
2. **Extract data / データの展開**
   - Unzip the file to the `src/` directory.
   - ZIPファイルを `src/` ディレクトリに展開します。
3. **Convert and filter attributes / 変換・属性整理**
   - Convert the layer `kgz_admbnda_adm1_moes_20181119` to GeoJSON Text Sequence using `ogr2ogr`.
   - `kgz_admbnda_adm1_moes_20181119` レイヤーを `ogr2ogr` でGeoJSON Text Sequenceに変換。
   - Use `jq` to filter and rename properties:
   - `jq` で属性を整理・リネーム：
     - `admin1Name_en` → `name_en`
     - `admin1Name_ky` → `name_ky`
     - `admin1Name_ru` → `name_ru`
     - `admin1Pcode`   → `pcode`
     - Exclude unnecessary fields (e.g., `Shape_Length`, `Shape_Area`).
     - 不要なフィールド（`Shape_Length`, `Shape_Area`等）は除外。
4. **Generate PMTiles / PMTiles生成**
   - Use `tippecanoe` to generate PMTiles from the filtered GeoJSON, outputting to `docs/ky1.pmtiles`.
   - 整理済みGeoJSONを `tippecanoe` でPMTiles化し、`docs/ky1.pmtiles` を出力。

All steps are automated with the provided `Makefile`.
すべての手順は `Makefile` で自動化されています。


## Usage / 使い方

```sh
make download   # Download source data / ソースデータのダウンロード
make extract    # Extract ZIP / ZIP展開
make produce    # Generate docs/ky1.pmtiles / docs/ky1.pmtiles生成
```


## Output / 出力

- `docs/ky1.pmtiles`: PMTiles file of Kyrgyzstan admin1 boundaries, suitable for web hosting.
- `docs/ky1.pmtiles`: キルギス行政区画（adm1）PMTilesファイル。Webホスティング対応。
- [View in PMTiles Viewer (pmtiles.io)](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)
- [PMTiles Viewer (pmtiles.io) で表示](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)


## License / ライセンス

### Source data / ソースデータ
- Data provided by Humanitarian Data Exchange (HDX) is licensed under [CC BY-IGO](https://creativecommons.org/licenses/by/3.0/igo/).
- Humanitarian Data Exchange (HDX) 提供データは [CC BY-IGO](https://creativecommons.org/licenses/by/3.0/igo/) ライセンスです。
- See [dataset page](https://data.humdata.org/dataset/cod-ab-kgz) for details.
- 詳細は [データセットページ](https://data.humdata.org/dataset/cod-ab-kgz) を参照してください。

### This repository / このリポジトリ
- The code and workflow in this repository are also released under [CC BY-IGO](https://creativecommons.org/licenses/by/3.0/igo/).
- 本リポジトリのコード・ワークフローも [CC BY-IGO](https://creativecommons.org/licenses/by/3.0/igo/) ライセンスで公開します。


## References / 参考リンク
- [Humanitarian Data Exchange: Kyrgyzstan - Administrative Boundaries](https://data.humdata.org/dataset/cod-ab-kgz)
- [PMTiles](https://github.com/protomaps/PMTiles)
- [tippecanoe](https://github.com/mapbox/tippecanoe)
- [jq](https://stedolan.github.io/jq/)
- [GDAL/ogr2ogr](https://gdal.org/programs/ogr2ogr.html)

## Contact / お問い合わせ
For questions or contributions, please open an issue or pull request.
ご質問・提案はIssueまたはPull Requestでお知らせください。
