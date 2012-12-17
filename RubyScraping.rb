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
   
end
