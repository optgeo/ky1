
## What you have / 利用ツール
- tippecanoe
- ogr2ogr
- Ruby (for property mapping and Japanese name addition)
- Ruby（属性マッピング・日本語名追加用）


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
- Switched from jq to Ruby for robust property mapping (UNIX pipeline: ogr2ogr → ruby → tippecanoe)
- jqからRubyに変更し堅牢な属性マッピングを実現（UNIXパイプライン: ogr2ogr→ruby→tippecanoe）
- Added Japanese name mapping (name_ja) from enja.tsv using Ruby script (add_ja.rb)
- Rubyスクリプト（add_ja.rb）でenja.tsvから日本語名（name_ja）をマッピング
- Filtered properties to essential fields only (name_en, name_ky, name_ru, pcode, name_ja)
- 必要な属性のみに絞り込み（name_en, name_ky, name_ru, pcode, name_ja）
- Set maximum zoom to 12 for detailed map viewing
- 詳細表示対応のため最大ズームを12に設定
- Enhanced README.md and NOTES.md (bilingual documentation)
- README.md・NOTES.mdを詳細化（バイリンガル文書）
- Added pmtiles.io viewer URL ([PMTiles Viewer](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)) to README.md
- pmtiles.ioビューワURL（[PMTiles Viewer](https://pmtiles.io/?url=https://optgeo.github.io/ky1/ky1.pmtiles)）をREADME.mdに追加
- Clarified source data and repository license (CC BY-IGO)
- ソースデータ・リポジトリのライセンス（CC BY-IGO）を明記
- Eliminated intermediate files with direct UNIX pipeline (no .geojsonseq files)
- 直接UNIXパイプラインで中間ファイルを排除（.geojsonseqファイル不要）
- Output (docs/ky1.pmtiles) is ready for GitHub Pages hosting
- 生成物（docs/ky1.pmtiles）はGitHub Pagesで公開可能
