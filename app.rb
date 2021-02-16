require 'sinatra'
require 'dotenv'

Dotenv.load


class Battle < Sinatra::Base
  configure do
    enable :sessions
  end
  
  get '/test' do
    'Testing infrastructure working!'
  end

  get '/' do
    erb :index
  end

  post '/players' do
    @player_1 = params[:player_1_name]
    @player_2 = params[:player_2_name]
    erb :players
  end
end
