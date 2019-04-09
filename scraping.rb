require 'nokogiri'
require 'selenium-webdriver'
require 'open-uri'

url = "https://www.sdvx.in/sort/sort_17.htm"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to url

#nokogiri初期設定

charset = nil
html = open(url) do |f|
	charset = f.charset
	f.read
end

doc = Nokogiri::HTML.parse(html,nil,charset)

p "------------------取得開始------------------"


p "--タイトル--"
p doc.title

p "--曲名--"
songs = driver.find_elements(:class => "f1")
	songs.each do |e|
		puts e.text
end

driver.quit

