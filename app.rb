# frozen_string_literal: true

require 'sinatra'
require './lib/player'
require './lib/game'

# controller for battle app class routes
class Battle < Sinatra::Base
  before { @game = Game.instance }

  get '/' do
    erb :index
  end

  post '/play' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    @game   = Game.create(player1, player2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    @game.attack(@game.other_player)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game.switch_turns
    erb :attack
  end

  get '/game-over' do
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
