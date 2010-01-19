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
  @video_src = case params[:type]
  when "rtsp"
    "rtsp://94.228.215.124:80/jonathan_ive_design.mp4"
  when "apple"
    "/t_10/prog_index.m3u8"
  when "oss"
    "/os_10/os_stream_multi.m3u8"
  when "flash"
    "http://www.youtube.com/v/t0fe800C2CU&hl=en_US&fs=1&"
  end
  haml params[:type].to_sym
end

helpers do
  def link_to(txt,url)
    "[ <a href='#{url}'>#{txt}</a> ]"
  end
end