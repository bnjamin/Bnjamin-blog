require 'rubygems'
require 'sinatra'
require 'article'
require 'project'
require 'coderay'   
require 'rack/codehighlighter'

use Rack::Codehighlighter, :coderay, :element => "pre", :pattern => /\A:::(\w+)\s*\n/

before do
  response.headers['Cache-Control'] = 'public, max-age=28800'
end

get '/about' do
  @title = "Rails Freelancer med fokus på forretningsværdi"
  haml :about
end

get '/' do
  @title = "Posts from a Rubyist from Denmark"
  @articles = Article.all
  haml :index
end

get '/contact' do
  @title = "Contact me"
  haml :contact
end

get '/article/:path' do
  @article = Article.new("articles/" + params[:path] + ".txt")
  @title = @article.title
  puts @article.body 
  haml :article
end

get '/projects' do
  @title = "My projects"
  @projects = Project.all 
  haml :projects
end

get '/stylesheets/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end
