require 'selenium-webdriver'
require 'open-uri'

driver = Selenium::WebDriver.for :chrome

p "------------------取得開始------------------"

j = 20

while j > 0
	url = "https://www.sdvx.in/sort/sort_#{j}.htm"
	driver.navigate.to url
	songs = driver.find_elements(:class => "f1")

	p "--LV.#{j}--"
	i = 0
	songs.each do |e|
		puts e.text
		i += 1
	end

	j -= 1

	p "--------"
	p "取得数：#{i}"

	sleep 2
end

driver.quit

