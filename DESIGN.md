
## What you have / 利用ツール
- tippecanoe
- ogr2ogr


## Objective / 目的
- Create docs/ky1.pmtiles which will be hosted by GitHub Pages as https://optgeo.github.io/ky1/ky1.pmtiles.
- docs/ky1.pmtiles を作成し、GitHub Pages（https://optgeo.github.io/ky1/ky1.pmtiles）で公開する。


## Source data / ソースデータ
- https://data.humdata.org/dataset/693aca77-1252-4404-9045-785e43bb6846/resource/ec494f47-9c13-4f0d-a0e3-8c2b6c1e8777/download/kgz-administrative-divisions-geodatabase.zip from https://data.humdata.org/dataset/cod-ab-kgz.
- Humanitarian Data Exchange (HDX) より公式行政区画データ（Geodatabase）を取得。


## Steps / 手順
1. Download the source data and unzip it under `src/`.
   - ソースデータをダウンロードし、`src/`に展開。
2. Investigate the contents and find 1st level administrative area data.
   - 内容を調査し、1次行政区画データを特定。
3. Use `tippecanoe` to create a `docs/ky1.pmtiles` file from the geodatabase. 
   - Use `ogr2ogr` to convert the geodatabase to GeoJSON Text Sequence if necessary.
   - Use `jq` to add `tippecanoe` properties to the GeoJSON features.
   - Use `tippecanoe` to create the PMTiles file.
   - Ensure that the output is in the correct format for PMTiles.
   - 必要に応じて`ogr2ogr`でGeoJSON Text Sequenceに変換。
   - `jq`でtippecanoe用プロパティを追加。
   - `tippecanoe`でPMTilesファイルを作成。
   - 出力がPMTiles形式であることを確認。
4. Create a URL that opens the PMTiles file.
   - PMTilesファイルを開くURLを作成。



## Extra steps and improvements performed / 追加実施事項

- Automated all steps with Makefile (download, extract, produce targets)
- 全工程をMakefileで自動化（download, extract, produceターゲット）
- Explicit CLI pipeline: ogr2ogr → jq → tippecanoe
- ogr2ogr→jq→tippecanoeのCLIパイプラインを明示
- Renamed and filtered properties with jq (only name_en, name_ky, name_ru, pcode)
- jqで属性名をリネーム（name_en, name_ky, name_ru, pcodeのみ抽出）
- Enhanced README.md (steps, license, output, references, contact)
- README.mdを詳細化（手順・ライセンス・成果物・参考リンク・問い合わせ）
- Added pmtiles.io viewer URL ([PMTiles Viewer](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)) to README.md
- pmtiles.ioビューワURL（[PMTiles Viewer](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)）をREADME.mdに追加
- Clarified source data and repository license (CC BY-IGO)
- ソースデータ・リポジトリのライセンス（CC BY-IGO）を明記
- Output (docs/ky1.pmtiles) is ready for GitHub Pages hosting
- 生成物（docs/ky1.pmtiles）はGitHub Pagesで公開可能
