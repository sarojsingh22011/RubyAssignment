require 'rubygems'

require 'nokogiri'

require 'open-uri'

page=Nokogiri::HTML(open('http://www.simplyrecipes.com/recipes/classic_baked_acorn_squash/'))


file1=File.new("C:/ruby/htmldata.txt","w+")


file1.syswrite("\n\n Name : ")

file1.syswrite(page.css('h1[itemprop=name]').text)

file1.syswrite("\n\n Description : ")

file1.syswrite(page.css('div[itemprop=description]').text)

file1.syswrite("\n\n Header : ")

file1.syswrite(page.css('h2').text)

file1.syswrite("\n\n Preparation Time : ")

file1.syswrite(page.css('.preptime').text)

file1.syswrite("\n\n Name : ")

file1.syswrite(page.css('.cooktime').text)

file1.syswrite("\n\n Ingredients : ")

file1.syswrite(page.css('.ingredient').text)

file1.syswrite("\n\n Recipe Instructions : ")

file1.syswrite(page.css('div[itemprop=recipeInstructions]').text)

file1.syswrite("\n\n Yield : ")

file1.syswrite(page.css('.yield').text)

file1.syswrite("\n\n")




