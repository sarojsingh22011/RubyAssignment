require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'
#require 'mysql2'

ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:database => "recipes",
:username => "root",
:password => "saroj",
:host => "localhost"
)

class Recipetable < ActiveRecord::Base
end
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))
doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each do |node|
link=node['href']

   
doc1=Nokogiri::HTML(open(link))
doc1.xpath('//h2/a').each do |node|
link2=node['href']
    
doc2 = Nokogiri::HTML(open(link2))
x=doc2.xpath('//div[@itemprop="description"]')
puts x
image_link=doc2.xpath('//div[@class="featured-image"]/img/@src')
puts image_link
ingredient=doc2.xpath('//div[@id="recipe-ingredients"]/ul/li[@class="ingredient"]').to_s() 
puts ingredient
instr=doc2.xpath('//div[@id="recipe-method"]/div[@itemprop="recipeInstructions"]').to_s()
puts instr				
Recipetable.create(:rname => node.content,:url => link,:rdes => x,:imglnk => image_link,:ringred => ingredient,:rinst => instr)
			 

end
end