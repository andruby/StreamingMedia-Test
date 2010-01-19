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

get '/view/:type' do
  raise Sinatra::NotFound unless %w{apple oss flash rtsp}.include? params[:type].to_s
  haml params[:type].to_sym
end

helpers do
  def link_to(txt,url)
    "[ <a href='#{url}'>#{txt}</a> ]"
  end
end