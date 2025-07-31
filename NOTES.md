# Technical Notes / 技術ノート（ky1プロジェクト）

## Overview / 概要

- Automated pipeline to generate PMTiles of Kyrgyzstan admin boundaries for web publishing.
- キルギス行政境界PMTilesをWeb公開用に自動生成するパイプライン。
- All steps are reproducible via Makefile.
- すべての手順はMakefileで再現可能。
- Japanese names (name_ja) are mapped from enja.tsv and added to properties.
- 日本語名（name_ja）はenja.tsvから属性に追加。

## Main Tools / 主な技術・ツール

- ogr2ogr: Geodatabase (.gdb) → GeoJSONSeq conversion
- ogr2ogr: Geodatabase（.gdb）→GeoJSONSeq変換
- Ruby: enja.tsv (name_en→name_ja) to hash, add name_ja to GeoJSONSeq
- Ruby: enja.tsv（name_en→name_ja）をハッシュ化し、GeoJSONSeqにname_ja属性を付与
- tippecanoe: GeoJSONSeq → PMTiles conversion
- tippecanoe: GeoJSONSeq→PMTiles変換
- Makefile: Automates all steps (download, extract, produce, clean)
- Makefile: 一連の処理をターゲット化（download, extract, produce, clean）

## name_ja Mapping / name_jaマッピングの仕組み

- enja.tsv (tab-separated: name_en, name_ja) is converted to hash in Ruby.
- enja.tsv（タブ区切り: name_en, name_ja）をRubyでハッシュ化。
- Ruby script (add_ja.rb) adds name_ja to each Feature's admin1Name_en in GeoJSONSeq.
- Rubyスクリプト（add_ja.rb）がGeoJSONSeq各Featureのadmin1Name_enに対応するname_jaを付与。
- Only required properties are extracted, layer/minzoom/maxzoom are added.
- 必要な属性のみ抽出し、layer/minzoom/maxzoomも付与。

## Intermediate Files & Cleanup / 中間ファイルとクリーンアップ

- adm1.geojsonseq: ogr2ogr output GeoJSONSeq (temporary file)
- adm1.geojsonseq: ogr2ogr出力のGeoJSONSeq（一時ファイル）
- adm1_ja.geojsonseq: GeoJSONSeq with name_ja added by Ruby (temporary file)
- adm1_ja.geojsonseq: Rubyでname_ja付与後のGeoJSONSeq（一時ファイル）
- enja_map.json, enja.json: Old intermediate files (currently unused)
- enja_map.json, enja.json: 旧方式の中間ファイル（現在は未使用）
- `make clean` removes all unnecessary files.
- `make clean`で不要ファイルを一括削除。

## Tips / 注意点・Tips

- jq --slurpfile/--argfile is environment-dependent; Ruby preprocessing is robust.
- jqの--slurpfile/--argfileは環境依存・制約あり。Rubyでの前処理が堅牢。
- tippecanoe warnings (Z dimension) can be ignored.
- tippecanoeの警告（座標の3次元目）は無視してOK。
- PMTiles output is docs/ky1.pmtiles.
- PMTiles成果物はdocs/ky1.pmtilesに出力。
- Attribution (license) is embedded via tippecanoe command.
- attribution（ライセンス表記）はtippecanoeコマンドで埋め込み。

## Example Commands / 参考コマンド例

```sh
make download   # Download source data / ソースデータのダウンロード
make extract    # Extract ZIP / ZIP展開
make produce    # Generate docs/ky1.pmtiles / docs/ky1.pmtiles生成
make clean      # Remove intermediate files / 中間ファイル削除
```

## File Structure / ファイル構成

- Makefile: Full automation
- Makefile: 全自動化
- add_ja.rb: Ruby script for name_ja mapping
- add_ja.rb: name_ja付与用Rubyスクリプト
- enja.tsv: name_en→name_ja mapping
- enja.tsv: name_en→name_jaマッピング
- docs/ky1.pmtiles: Final output
- docs/ky1.pmtiles: 最終成果物

---
Final output is ready for GitHub Pages hosting.
最終成果物はGitHub Pagesで配信可能です。
