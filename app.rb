ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './models/link'
require_relative 'data_mapper_setup'

class Bookmarks < Sinatra::Base
  #
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end


  post '/links' do
    link = Link.create(url: params[:url], title: params[:title]) #create a link
    params[:tags].split.each do |tag| #split the tags
    # tag = Tag.first_or_create(name: params[:tags]) #create tag for that link
    link.tags << Tag.create(name: tag)
    end   #add the multiple tag to the collection of tags (that you already have)
    link.save #save the link
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
