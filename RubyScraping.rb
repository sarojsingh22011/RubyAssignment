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
:host => "127.0.0.1"
)

class Recipetable < ActiveRecord::Base
end
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))
doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each do |node|
    Recipetable.create(:rname => node.content,:url => node['href'])
    link=node['href']
   
   doc1=Nokogiri::HTML(open(link))
    doc1.xpath('//h2/a').each do |node|
    Recipeindex.create(:iname => node.content,:url1 => node['href'])
    link2=node['href']
    =begin  
doc2=Nokogiri::HTML(open(link2))
   x=doc2.xpath('//div[@itemprop="description"]')
   e.gsub!(/(<[^>]*>)|\n|\t/s){""}
   
   ingredient=doc2.xpath('//div[@id="recipe-ingredients"]/ul/li[@class="ingredient"]').to_s() #.gsub!(/(<[^>]*>)|\n|\t/s){""}
   ingredient.gsub!(/(<[^>]*>)|\n|\t/s){""}

   method=doc2.xpath('//div[@id="recipe-method"]/div[@itemprop="recipeInstructions"]').to_s()
   method.gsub!(/(<[^>]*>)|\n|\t/s){""}
    =end
    

  end  
    
end
