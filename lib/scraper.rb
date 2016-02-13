require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'open-uri'
require 'pry'


module ScrapWrap
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
  include ScrapWrap

  def initialize(url)
    @url = url
    browser = new_session
    browser.visit @url
    games = browser.all '.soccer'
    binding.pry
  end

end

hello = Scraper.new('http://flashscore.com')


