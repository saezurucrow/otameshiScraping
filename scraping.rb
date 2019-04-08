require 'nokogiri'
require 'selenium-webdriver'
require 'open-uri'

url = "https://p.eagate.573.jp/game/sdvx/v/p/ranking/index.html"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to url

driver.find_element(:xpath, '//*[@id="login_btn"]/a').click

sleep 1

driver.find_element(:xpath, '//*[@id="id_lgfm_inline"]/div/div[2]/div[1]/div[3]/input').send_keys 'rentti12345'
driver.find_element(:xpath, '//*[@id="id_lgfm_inline"]/div/div[2]/div[2]/div[3]/input').send_keys '19990105ren'

#nokogiri初期設定

charset = nil
html = open(url) do |f|
	charset = f.charset
	f.read
end

doc = Nokogiri::HTML.parse(html,nil,charset)

for i in 1..5
	p i
	sleep 1
end


p "--タイトル--"
p doc.title

p "--曲名--"
songs = driver.find_elements(:class => "music_name")
songs.each do |e|
	puts e.text
end

driver.find_element(:xpath,'//*[@id="music_box"]/div[11]/ddispnext/a').click


driver.quit

