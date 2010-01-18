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