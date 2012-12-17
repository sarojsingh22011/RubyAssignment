require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'
#require 'mysql2'


$arr1 = Array.new
$arr2 = Array.new
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

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a/@href').each_with_index do |node|
   $arr2 << node.text
 end

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node|
   $arr1 << node.text
   
 end

$arr1.each do |a1|
puts a1
end

$arr2.each do |a2|
puts a2
end

$arr1.each do |index|
Recipetable.create(:rname => index);

end
