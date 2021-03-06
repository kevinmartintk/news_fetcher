require "nokogiri"
require "open-uri"
class NewsFetcher
	include Nokogiri
  def self.hi
    puts "Hi, I'm NewsFetcher!"
  end

  def self.fetch url, structure, color
    color ||= "black"
  	doc = Nokogiri::HTML(open(url))
  	nodes = doc.css(structure)
  	nodes.each do |n|
  		puts n.text.strip.send(color)
      puts
  	end
    return doc, nodes
  end
end