require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  configure do
    enable :sessions
    set    :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  post '/play' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/attack' do
    @game = Game.instance
    @game.attack(@game.other_player)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = Game.instance
    @game.switch_turns
    erb :attack
  end

  get '/game-over' do
    @game = Game.instance
    erb :game_over
  end

  run! if app_file == $0
end
