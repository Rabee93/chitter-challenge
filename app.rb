require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb(:posts)
  end

  post '/status' do
    @peep = params[:peep]
    erb(:peeps)
  end


  run! if app_file == $0
end
