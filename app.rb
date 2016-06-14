ENV["RACK_ENV"] ||= 'development'
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
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

  run! if app_file == $0
end
