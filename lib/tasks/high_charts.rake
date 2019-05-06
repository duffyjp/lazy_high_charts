# Below implement highcharts js files bootstrap logic
def download(file)
  print "#{file} - "
  system "curl -s http://code.highcharts.com/#{file} -L --compressed -o vendor/assets/javascripts/highcharts/#{file}"
  puts File.read("./vendor/assets/javascripts/highcharts/#{file}").scan(/Highcharts JS (.*)/)&.first&.first || "???"

end

namespace :highcharts do
  desc "Update highcharts.js from latest Builds on Highcharts codebase: http://code.highcharts.com/"

  task :update do
    [
      'highcharts.js',
      'highcharts-more.js',

      'modules/accessibility.js',
      'modules/annotations.js',
      'modules/boost.js',
      'modules/broken-axis.js',
      'modules/canvas-tools.js',
      'modules/data.js',
      'modules/exporting.js',
      'modules/drilldown.js',
      'modules/funnel.js',
      'modules/heatmap.js',
      'modules/no-data-to-display.js',
      'modules/offline-exporting.js',
      'modules/sankey.js',
      'modules/solid-gauge.js',
      'modules/treemap.js',

      'stock/highstock.js',
    ].map{|file| download(file)}

  end
end
