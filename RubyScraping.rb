require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'

$arr1 = Array.new
$arr2 = Array.new
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a/@href').each_with_index do |node|
   $arr2 << node.text
 end

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node|
   $arr1 << node.text
 end

#$arr1.each do |a1|
#puts a1
#end

#$arr2.each do |a2|
#puts a2
#end

ActiveRecord::Base.establish_connection(
:adapter=>"mysql2",
:host=>"localhost",
:database=>"recipes",
:username=>"saroj",
:password=>"saroj"
)

class recipetable < ActiveRecord::Base
end
$i=0
while $i<500 do
$val=$a1.at($i)
recipetable.create(:id => #$i, :recipe_list => "#$val")
$i +=1
end
