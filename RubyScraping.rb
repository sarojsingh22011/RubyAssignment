require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'

$arr1 = Array.new
$arr2 = Array.new
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a/@href').each_with_index do |node, i|
   $arr2 << node.text
  break if i == 10;
 end

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node, i|
   $arr1 << node.text
  break if i == 10;
 end

$arr1.each do |a1|
puts a1
end

$arr2.each do |a2|
puts a2
end

ActiveRecord::Base.establish_connection(
:adapter=>"mysql",
:host=>"localhost",
:database=>"students"
:username=>saroj
:password=>saroj
)

class recipetables < ActiveRecord::Base
end

recipetables.create()
recipetables.create()
recipetables.create()



