require File.dirname(__FILE__) + '/spec_helper'

describe "Blog" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "responds to /" do
    get '/'
    last_response.should be_ok
  end
  
  it "responds to /about" do
    get '/about'
    last_response.should be_ok
  end
  
  it "responds to /projects" do
    get '/projects'
    last_response.should be_ok
  end
end

describe Article do
  it "initializes with one argument" do
    lambda { Article.new(  ) }.should raise_error(ArgumentError)
    lambda { Article.new( "spec/test_articles/article1.yaml" ) }.should_not raise_error 
  end
  
  it "loads the yaml fields" do
    @article = Article.new("spec/test_articles/article1.yaml")
    @article.title.should == "Hello"
    @article.content.should == "Hello World"
  end
  
  it "loads all the yaml files" do
    Dir.new("spec/test_articles").each do |file|
      puts file if file
    end 
  end
end