ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'pry'

@URL = 'http://flashscore.com'

def build_session
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
  end
  Capybara.default_driver = :poltergeist
  Capybara.current_session
end

def fetch_data(session)
  session.visit @URL
  Nokogiri::HTML.parse(session.html)
end

def get_leagues(doc)
  leagues = doc.css('.table-main .soccer')
end

def build_game
  @game = Game.new
end

def save_game
  @game.save!
  puts "games: #{Game.count}"
end

def get_games(l)
 l.css('tbody tr')
end

def handle_leagues(doc)
  @leagues = 0
  get_leagues(doc).each do |l|
    puts "leagues: #{@leagues += 1}"
    handle_games(l, get_games(l))
  end
end

def handle_games(league, games)
   games.each do |g|
     build_game
     score               = g.at_css('.score').text
     @game['home_team']  = g.at_css('.team-home span').text
     @game['away_team']  = g.at_css('.team-away span').text
     @game['home_score'] = /^\d+/.match(score).to_s.to_i
     @game['away_score'] = /(?<=-).+/.match(@game['away_score']).to_s.tr(' ', '').to_i
     @game['timer']      = g.at_css('.timer').text
     @game['time']       = g.at_css('.time').text
     @game['country']    = league.at_css('.country_part').text.tr(' ', '').downcase[/\w+/]
     @game['tournament'] = league.at_css('.tournament_part').text
     @game['sport']      = 'soccer'
     @game['source']     = @URL
     save_game
   end
end

def run_scraper
  raw_doc = fetch_data(build_session)
  handle_leagues(raw_doc)
end

run_scraper
