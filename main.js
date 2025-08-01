// main.js
import maplibregl from 'maplibre-gl';
import 'maplibre-gl/dist/maplibre-gl.css';
import { GlobeControl } from 'maplibre-gl'; // 本体に含まれる場合

// デフォルトスタイルをGLobeに対応するものに更新
const DEFAULT_STYLE = 'https://demotiles.maplibre.org/style.json';

const map = new maplibregl.Map({
  container: 'map',  // HTML側に <div id="map"></div> を用意
  style: DEFAULT_STYLE,
  center: [74.6, 42.9],
  zoom: 5
});

// GlobeControlを追加
const globeControl = new GlobeControl();
map.addControl(globeControl);

// onload時に自動でGlobeモードに切り替え
map.on('load', () => {
  map.setProjection('globe');
  // ボタンUIを同期
  if (typeof globeControl._updateUI === 'function') {
    globeControl._updateUI();
  }
});
