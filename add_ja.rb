require 'json'
map = {}
File.foreach(ARGV[1]) { |l| k,v = l.chomp.split("\t"); map[k] = v }
File.foreach(ARGV[0]) do |line|
  f = JSON.parse(line)
  props = f['properties']
  f['properties'] = {
    'name_en' => props['admin1Name_en'],
    'name_ky' => props['admin1Name_ky'],
    'name_ru' => props['admin1Name_ru'],
    'pcode'   => props['admin1Pcode'],
    'name_ja' => map[props['admin1Name_en']] || nil,
    'layer'   => 'adm1',
    'minzoom' => 0,
    'maxzoom' => 6
  }
  puts JSON.dump(f)
end
