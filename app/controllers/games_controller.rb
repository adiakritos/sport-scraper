class GamesController < ApplicationController

  def index
    @games       = Game.all
    @game_count  = Game.count
  end

end
