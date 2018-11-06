# URLにアクセスするためのライブラリの読み込み
require 'open-uri'

namespace :scrape do
  desc 'メルカリから検索対象ワードと一致する商品情報タイトルを取得'
  task :mercari => :environment do
    keyword = 'rails'
    # スクレイピング先のURL
    url = "https://www.mercari.com/jp/search/?keyword=" + keyword

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    result = Nokogiri::HTML.parse(html, nil, charset)

    result.xpath('//section[@class="items-box"]').each do |node|
      # タイトル、値段の取得
      puts node.css('h3').inner_text
      puts node.css('div.items-box-price').inner_text + ' ' + node.css('p.item-box-tax').inner_text
    end
  end

end
