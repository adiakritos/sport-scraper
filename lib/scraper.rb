require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'open-uri'
require 'pry'


module ScrapWrapper
  require 'capybara'
  require 'capybara/poltergeist'

  def new_session
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end

    Capybara.default_driver   = :poltergeist

    @session = Capybara.current_session
  end

  def html
    @session.html
  end

end

class Scraper
  include ScrapWrapper

  def initialize(url)
    @url = url
    browser = new_session
    browser.visit @url

    @html = Nokogiri::HTML.parse(browser.html)

    games = @html.css('.table-main .soccer')

    game = games.first

    country    = game.at_css('.country_part').text.tr(' ', '')
    league     = game.at_css('.tournament_part').text
    home_team  = game.at_css('.team-home span').text
    away_team  = game.at_css('.team-away span').text
    score      = game.at_css('.score').text
    home_score = /^\d+*/.match(score).to_s.to_i
    away_score = score
    timer      = game.at_css('.timer').text
    time       = game.at_css('.time').text
    sport = 'soccer'
    source = @url



    binding.pry
  end

end

Scraper.new('http://flashscore.com')
