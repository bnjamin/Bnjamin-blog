require 'yaml'

class Article
  
  attr_reader :path

  def initialize(path)
    @yaml = YAML.load(File.new(path))
    @path = 'article/' + File.basename(path, '.yaml')
  end

  def self.all(path = "articles")
    Dir["#{path}/*.yaml"].collect { |file| Article.new(file) }
  end

  private

  def method_missing(method_sym, *arguments, &block)
    if @yaml[method_sym.to_s] 
      @yaml[method_sym.to_s]
    else
      super
    end
  end
  
end
