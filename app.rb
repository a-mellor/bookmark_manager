require 'sinatra/base'
require_relative 'lib/viewing_links'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/links' do
    Link.create(url: params[:URL], title: params[:Title])
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
