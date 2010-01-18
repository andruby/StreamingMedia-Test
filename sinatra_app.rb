require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

set :haml, {:format => :html5 }

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

get '/' do
  haml :index
end

get '/http_live_apple' do
  haml :apple
end

get '/http_live_oss' do
  haml :oss
end

get '/flash' do
  haml :flash
end

helpers do
  def link_to(txt,url)
    "[ <a href='#{url}'>#{txt}</a> ]"
  end
end