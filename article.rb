require 'yaml'

class Article
  
  attr_reader :path, :body

  def initialize(path)
    meta, @body = File.read(path).split(/\n\n/, 2)
    @yaml = YAML.load(meta)
    @path = 'article/' + File.basename(path, '.txt')
  end

  def self.all(path = "articles")
    Dir["#{path}/*.txt"].reverse.collect { |file| Article.new(file) }
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
