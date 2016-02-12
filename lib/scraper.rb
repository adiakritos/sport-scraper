require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'open-uri'
require 'pry'

class Scraper

  def go

   c = Capybara.default_driver = :poltergeist

   #doc = Nokogiri::HTML.parse(bwser.html)

   #table = doc.css('.table-main')
   #games = table.css('.soccer')

    binding.pry
  end

end

s = Scraper.new
s.go
