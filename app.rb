
require 'sinatra/base'
 require_relative 'lib/chitter'

class Chittercontroller < Sinatra::Base
  get '/' do
    erb(:posts)
  end

  post '/status' do
    @peep = (params[:peep])
    Chitter.add(@peep)
    redirect('/list')
  end

  get '/list' do
    @list = Chitter.all.reverse
    erb(:list)
end


  run! if app_file == $0
end
