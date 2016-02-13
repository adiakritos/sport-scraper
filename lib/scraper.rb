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

  ##games.each do |game|
  ##  score = game.at_css('.score').text
  ##
  ##  new_game.country    = game.at_css('.country_part').text.tr(' ', '')
  ##  new_game.league     = game.at_css('.tournament_part').text
  ##  new_game.home_team  = game.at_css('.team-home span').text
  ##  new_game.away_team  = game.at_css('.team-away span').text
  ##  new_game.home_score = /^\d+/.match(score).to_s.to_i
  ##  new_game.away_score = /(?<=-).+/.match(away_score).to_s.tr(' ', '').to_i
  ##  new_game.timer      = game.at_css('.timer').text
  ##  new_game.time       = game.at_css('.time').text
  ##  new_game.sport      = 'soccer'
  ##  new_game.source     = @url
  ##
  ##end

    binding.pry
  end

end

Scraper.new('http://flashscore.com')
