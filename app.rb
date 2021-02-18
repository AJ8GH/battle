require 'sinatra'
require_relative 'lib/player'

class Battle < Sinatra::Base
  configure do
    enable :sessions
    set    :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  post '/play' do
    p params
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    p params
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_hp   = $player_1.hp
    @player_2_hp   = $player_2.hp
    erb :play
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :attack
  end
  
  run! if app_file == $0
end
