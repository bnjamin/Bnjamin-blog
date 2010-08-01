require 'rubygems'
require 'sinatra'
require 'article'
require 'coderay'   
require 'rack/codehighlighter'

use Rack::Codehighlighter, :coderay, :element => "pre", :pattern => /\A:::(\w+)\s*\n/

get '/' do
  @title = "Posts from a Rubyist from Denmark"
  @articles = Article.all
  haml :index
end

get '/article/:path' do
  @article = Article.new("articles/" + params[:path] + ".yaml")
  @title = @article.title
  haml :article
end

get '/about' do
  @title = "Geek who loves programming in ruby and the interwebs"
  haml :about
end

get '/projects' do
  @title = "My projects"
  haml :projects
end